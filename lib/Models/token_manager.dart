import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'auth_token';

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}