import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';
import 'package:wedding_planning_application/models/ProfileModels/addprofileeinformation.dart';
class Updatepersoninfo{
  Future<void> updateprofilerepo(Addprofile add) async {
    try {
    
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

    
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // log(jsonEncode(add));


      // Send the request
      final response = await http.put(
        Uri.parse('$apiUrl/user/update'),
        headers: headers,
        body: jsonEncode(add),
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('information  Updated successfully.');
         showSnackkBar(
          message: 'information changed successfully',
          title: 'Complete',
          icon: const Icon(Icons.update),
        );
      } else {
        throw Exception('Failed to add information : ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding information : $e');
      throw Exception('Failed to add information : $e');
    }
  }
}