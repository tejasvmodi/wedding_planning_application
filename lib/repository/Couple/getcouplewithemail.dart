// import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/token_manager.dart';
// import 'package:wedding_planning_application/models/Couple/Addcouple.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Addcouplerepo {
  Future<void> addcouple(String add) async {
    try {
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Set the authorization header
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // Send the request
      final response = await http.post(
        Uri.parse('$apiUrl/user/couple/$add'),
        headers: headers,
      );

      // Check the response status code
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log(response.body.toString());
        log('Couple created successfully.');
      } else {
        throw Exception('Failed to create Couple: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error createing Couple: $e');
      throw Exception('Failed to create Couple: $e');
    }
  }
}
