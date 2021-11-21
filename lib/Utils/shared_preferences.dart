// import 'package:shared_preferences/shared_preferences.dart';

// class MySharedPrefs {
//   /// reference of Shared Preferences
//   static SharedPreferences? _preferences;

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setIsLoggedIn({required bool isLoggedIn}) async =>
//       await _preferences!.setBool(Strings.LOGGED_IN, isLoggedIn);

//   static bool? getIsLoggedIn() => _preferences!.getBool(Strings.LOGGED_IN);

//   static Future<bool> setLocale({required bool langLocale}) async =>
//       await _preferences!.setBool(Strings.LANG_LOCALE, langLocale);

//   static bool? getLocale() => _preferences!.getBool(Strings.LANG_LOCALE);

//   static Future clearSharedPreferences() async => _preferences!.clear();
// }
