import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/data/forgotpassword.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Forgetpassword {
  Future<void> forgetpassword(Forgotpasswordmodel user) async {
    log(jsonEncode(user));
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/forget-password'),
        body: jsonEncode(user), // Encode user data directly
        headers: {
          'Content-Type': 'application/json'
        }, // Remove content-type from headers
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('Email link is shared successfully');
        Get.offAll(() => const LoginForm());
        showSnackkBar(
          message: 'Check your email to change the password',
          title: 'Link Send',
          icon: const Icon(Icons.send),
        );
      } else {
         Get.offAll(() => const LoginForm());
        showSnackkBar(
          message: 'Email is not valid or not registered',
          title: 'Link Send',
          icon: const Icon(Icons.error),
        );
        throw Exception('Failed to register user');
      }
    } catch (e) {
        Get.offAll(() => const LoginForm());
        showSnackkBar(
          message: 'Email is not valid or not registered',
          title: 'Link Send',
          icon: const Icon(Icons.error),
        );
      log('Exception during registration: $e');
      throw Exception('Failed to register user');
    }
  }
}
