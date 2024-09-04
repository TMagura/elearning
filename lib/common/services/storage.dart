import 'dart:convert';

import 'package:elearning/common/model/user.dart';
import 'package:elearning/common/utils/constants.dart';
import'package:shared_preferences/shared_preferences.dart';
class StorageService{
  late final SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future <bool> setString (String key, String value) async {
    return await _pref.setString(key, value);
  }
  String getString (String key){
    return  _pref.getString(key)??"";
  }

//storing our token in shared preferences.
  String getUserToken(){
   return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }

  Future<bool>setBool(String key , bool value) async {
    return await _pref.setBool(key, value);
  }
//check if user had once used the app 
  bool getDeviceFirstOpen(){
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY)??false;
  }
//check f user is logged in by getting the prof key
  bool isLoggedIn(){
    return _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)!=null?true:false;
  }
  //map to capture data/ get user profile detail
  UserProfile getUserProfile(){
    var profile = _pref.getString(AppConstants.STORAGE_USER_PROFILE_KEY)??"";
    var profileJson = jsonDecode(profile);
    var userProfile = UserProfile.fromJson(profileJson);
    return userProfile;
  }
  
  



}