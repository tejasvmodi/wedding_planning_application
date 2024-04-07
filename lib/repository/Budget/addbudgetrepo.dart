import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Budget/addbudget.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Addbudgetrepo {
  Future<void> addbudgetrepo(BudgetRequest add) async {
    try {
      // log(jsonEncode(add));
      // log(add.expenceAmount.toString());
      // log(add.serviceCategory.toString());
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Convert request body to JSON

      // Set the authorization header
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // log(jsonEncode(add));


      // Send the request
      final response = await http.post(
        Uri.parse('$apiUrl/budget'),
        headers: headers,
        body: jsonEncode(add),
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('budget  added successfully.');
      } else {
        throw Exception('Failed to add budget : ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding budget : $e');
      throw Exception('Failed to add budget : $e');
    }
  }
}
