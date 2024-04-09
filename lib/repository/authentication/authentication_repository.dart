import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/exception/auth_exception.dart';
import 'package:wedding_planning_application/Models/data/login_data.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/models/data/registration_data.dart';
import 'package:wedding_planning_application/screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/util/constant.dart';
import 'package:wedding_planning_application/util/utils.dart';

class AuthenticationRepository extends GetxController {

  late SharedPreferences prefs;

  Future<void> loginUserWithNameEmailAndPassword(
      String email, String password) async {
    prefs = await SharedPreferences.getInstance();

    try {
      final response = await http.post(
        Uri.parse("$apiUrl/auth/login"),
        body: LoginModel(username: email, password: password).toJson(),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await prefs.setBool("isLoggedIn", true);
        await TokenManager.saveToken(data['token']);

        Get.offAll(() => ScreenNavigation());

        // log(data['token']);
      } else if (response.statusCode == 500) {
        Get.offAll(() => const LoginForm());
        showSnackkBar(
          message: 'Username Or Password Invalid',
          title: 'Try Again',
          icon: const Icon(Icons.error),
        );
        throw SignUpWithEmailAndPasswordFailure.code("404");
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure();
      showSnackkBar(
        message: ex,
        title: 'Try Again',
        icon: const Icon(Icons.error),
      );
    }
  }

  Future<void> registerUser(Registrationdata user) async {
  prefs = await SharedPreferences.getInstance();
  log(jsonEncode(user));
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/signup'),
      body: jsonEncode(user), // Encode user data directly
      headers: {'Content-Type': 'application/json'}, // Remove content-type from headers
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await prefs.setBool('Registered', true);
      await TokenManager.saveToken(data['token']);
      Get.offAll(() => ScreenNavigation());
    } else {
      throw Exception('Failed to register user');
    }
  } catch (e) {
    log('Exception during registration: $e');
    throw Exception('Failed to register user');
  }
}

  Future<void> logOut() async {
    await prefs.clear();
    Get.offAll(() => const LoginForm());
  }
}
