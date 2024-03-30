import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Checklist/updatechecklist.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class UpdateCheckListrepo {
  Future<void> updateChecklistrepo(Updaatechecklist update) async {
    try {
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Construct request body
      Map<String, dynamic> requestBody = {
       'checklistId': update.checklistId,
       'status':update.status,
      };

      // Convert request body to JSON
      String requestBodyJson = jsonEncode(requestBody);

      // Set the authorization header
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // Send the request
      final response = await http.put(
        Uri.parse('$apiUrl/checklist'),
        headers: headers,
        body: requestBodyJson,
      );

      // Check the response status code
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('CheckList Updated successfully.');
      } else {
        throw Exception('Failed to update CheckList: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error update CheckList: $e');
      throw Exception('Failed to update CheckList: $e');
    }
  }
}
