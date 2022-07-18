

import 'package:jane/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';





class UserSessionManager{

  static SharedPreferences? _preferences;


  static Future init()async{
    _preferences = await SharedPreferences.getInstance();
  }


  static Future setemail(String email) async{
    await _preferences!.setString(Constants.EMAILADDRESS, email);
  }





}