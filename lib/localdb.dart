import 'package:shared_preferences/shared_preferences.dart';
class LocalDataSaver{
  static String nameKey = "NAMEKEY";
  static String emailKey = "EMAILKEY";
  static String logKey = "LOGWALIKEY";

  static Future<bool> saveName(String username) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, username);
  }

  static Future<bool> saveMail(String useremail) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, useremail);
  }



  static Future<String?> getName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(nameKey);
  }


  static Future<String?> getEmail() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(emailKey);
  }




  static Future<bool> saveLoginData(bool isUserLoggedIn)
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn);
  }

  static Future<bool?> getLogData() async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getBool(logKey);
  }
}


