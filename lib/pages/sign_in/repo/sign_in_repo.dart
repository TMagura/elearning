import 'package:elearning/common/model/user.dart';
import 'package:elearning/common/services/http_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo{

  static Future<UserCredential> firebaseSignIn(String email, String password) async {
    final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
  }

  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      "api/login", 
      queryParameters: params!.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }

}

