import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/Couple/Addcouple.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Addcouplerepo {
  Future<void> addcouple(Addcouple add) async {
    try {
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }
      Map<String, dynamic> requestBody = {
        "firstName": add.firstName,
        "lastName": add.lastName,
        "email": add.email,
        "password": add.password,
        "couple": add.couple,
        "user": add.user
      };

      String requestBodyJson = jsonEncode(requestBody);
      log(requestBodyJson);
      // Set the authorization header
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // Send the request
      final response = await http.post(
        Uri.parse('$apiUrl/user/couple'),
        headers: headers,
        body: requestBodyJson,
      );

      // Check the response status code
      log(response.statusCode.toString());
     log(response.body.toString());
      if (response.statusCode == 200) {
   
        log('Couple created successfully.');
          showSnackkBar(
          message: 'Couple add successfully',
          title: 'Complete',
          icon: const Icon(Icons.add),
        );
      } else {
          showSnackkBar(
          message: 'Couple not add ',
          title: 'not Complete',
          icon: const Icon(Icons.error),
        );
        throw Exception('Failed to create Couple: ${response.reasonPhrase}');
      }
    } catch (e) {
       showSnackkBar(
          message: 'Couple not add ',
          title: 'not Complete',
          icon: const Icon(Icons.error),
        );
      log('Error createing Couple: $e');
      throw Exception('Failed to create Couple: $e');
    }
  }
}
