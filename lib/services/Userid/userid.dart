
import 'package:shared_preferences/shared_preferences.dart';

Future<int?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getInt('userId');
  return userId;
}

