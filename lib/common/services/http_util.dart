import 'package:dio/dio.dart';
import 'package:elearning/common/utils/constants.dart';
import 'package:elearning/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() {
    //this is the way of creating a singleton
    return _instance;
  }
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5000),
      receiveTimeout: const Duration(seconds: 5000),
      headers: {},
      contentType: "application/json: charset=utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("app request data: ${options}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print("app response data: ${response.data}");
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        print("app error data $e");
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
      },
    ));
  }
  //to talk with backend we need headers, with access tokens
  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

//create methods to talk with backend
  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    print("hit post");
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    print(response.data);
    return response.data;
  }
}

//create error exceptions for Dio
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception code $code, $message";
  }
}

//catch different Dio errors
ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection time out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send time out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive time out");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "request syntsx error");
        case 401:
          return ErrorEntity(code: 401, message: "permission denied");
      }
      return ErrorEntity(code: -1, message: "Bad Response");
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server cancelled it");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  print("error code: ${eInfo.code}, error message: ${eInfo.message}");
  switch (eInfo.code) {
    case 400:
      print("Syntax error");
      break;
    case 401:
      print("denied to continue");
      break;
    case 500:
      print("server error");
      break;
    default:
      print("Unknown errors");
      break;
  }
}
