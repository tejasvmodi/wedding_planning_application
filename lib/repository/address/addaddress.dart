import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Address/addAdress.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class AddAddress{
  Future<void> addbudgetrepo(AddAdress add) async {
    try {
    
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

    
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      log(jsonEncode(add));


      // Send the request
      final response = await http.post(
        Uri.parse('$apiUrl/address'),
        headers: headers,
        body: jsonEncode(add),
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('address  added successfully.');
      } else {
        throw Exception('Failed to add address : ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding address : $e');
      throw Exception('Failed to add address : $e');
    }
  }
}