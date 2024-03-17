import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/Exception/auth_exception.dart';
import 'package:wedding_planning_application/Models/login_formmodel.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/Util/constant.dart';
import 'package:wedding_planning_application/util/utils.dart';

class AuthenticationRepo extends GetxController {
  late SharedPreferences prefs;

  Future<void> loginUserWithNameEmailAndPassword(
      String email, String password) async {
         prefs = await SharedPreferences.getInstance();
        
   // Declared here to make it accessible in the entire method
    try {
      final response = await http.post(
        Uri.parse("$apiUrl/auth/login"),
        body: LoginModel(username:email , password: password).toJson(),
        headers: {'Content-Type': 'application/json'},
        
      );  
  // log(response.statusCode.toString());
      if (response.statusCode == 200) {
    
  final data = jsonDecode(response.body);
    //  log(data.toString());
  await prefs.setBool("isLoggedIn", true);
  await TokenManager.saveToken(data['token']);
     // Navigate to the appropriate screen
      Get.offAll(() => Screen_Navigation());
      
  // log(data['token']);
} else if (response.statusCode == 500) {
  Get.offAll(() => const Login_form());
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
    
      // Handle other exceptions if needed
    }
  }

  Future<void> logOut() async {
    await prefs.clear();
    Get.offAll(() => const Login_form());
  }
}
