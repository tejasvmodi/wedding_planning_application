import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Checklist/addchecklist.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class AddCheckListrepo {
  Future<void> addChecklistrepo(AddCheckList add) async {
    try {
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Construct request body
      Map<String, dynamic> requestBody = {
        'listItem': add.listItem,
        'status': add.status,
      };

      // Convert request body to JSON
      String requestBodyJson = jsonEncode(requestBody);

      // Set the authorization header
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json', // Set content type to JSON
      };

      // Send the request
      final response = await http.post(
        Uri.parse('$apiUrl/checklist'),
        headers: headers,
        body: requestBodyJson,
      );

      // Check the response status code
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        log('CheckList added successfully.');
      } else {
        throw Exception('Failed to add CheckList: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding CheckList: $e');
      throw Exception('Failed to add CheckList: $e');
    }
  }
}
