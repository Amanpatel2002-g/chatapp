import 'package:shared_preferences/shared_preferences.dart';

class helperFunctions {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";
  static String sharedPreferenceUserNameKey = "USERNAMEKEY";
  static String sharedPreferenceUserEmailKey = "USEREMAILKEY";

  // saving data to sharepreferences

  static Future<bool> saveuserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }
  static Future<bool> saveUserNameSharedPreference(
      String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(sharedPreferenceUserNameKey, userName);
  }
  static Future<bool> saveUserEmailSharedPreference(
      String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(sharedPreferenceUserEmailKey, userEmail);
  }

  // getting the data from the shared value

  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceUserLoggedInKey);
  }
  static Future<bool?> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceUserNameKey);
  }
  static Future<bool?> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(sharedPreferenceUserEmailKey);
  }

}
