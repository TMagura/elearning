import 'package:fluttertoast/fluttertoast.dart';
//this type is a positional optional parameter
toastInfo([String msg =""]){
  return Fluttertoast.showToast(msg: "");
}