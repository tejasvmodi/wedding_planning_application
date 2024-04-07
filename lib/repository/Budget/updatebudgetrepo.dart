import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Budget/updatebudget.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class UpdatebudgetRepo{
 Future<void> updatebudgetrepo(Updatebudget add) async {
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
        Uri.parse('$apiUrl/budget'),
        headers: headers,
        body: jsonEncode(add),
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('budget  Updated successfully.');
      } else {
        throw Exception('Failed to add budget : ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding budget : $e');
      throw Exception('Failed to add budget : $e');
    }
  }
}