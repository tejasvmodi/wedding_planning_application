import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/data/forgotpassword.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Forgetpassword{

  Future<void> forgetpassword(Forgotpasswordmodel user) async {
 
  log(jsonEncode(user));
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/forget-password'),
      body: jsonEncode(user), // Encode user data directly
      headers: {'Content-Type': 'application/json'}, // Remove content-type from headers
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
  log('Email link is shared successfully');
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    log('Exception during registration: $e');
    throw Exception('Failed to register user');
  }
}
}