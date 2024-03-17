import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/Util/constant.dart';
import 'package:wedding_planning_application/Models/registrationmodel.dart';

class RegistrationRepository {
  late SharedPreferences prefs;
  Future<void> registerUser(String firstName, String lastname,String email, String password,String couple) async {
      prefs = await SharedPreferences.getInstance();
       
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/auth/signup'),
        
        body: RegistrationModel(firstName: firstName, lastname: lastname, email: email, password: password, couple: couple).toJson(),
        headers: {'Content-Type': 'application/json'},
      );

      // log(response.body.toString());

      if (response.statusCode == 200) {
      final data =jsonDecode(response.body);
       await prefs.setBool('Registered',true);
       await TokenManager.saveToken(data['token']);
      Get.offAll(() => Screen_Navigation());
      
  // log(data['token']);
}  else {
        
        throw Exception('Failed to register user');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception during registration: $e');
      throw Exception('Failed to register user');
    }
  }
}
