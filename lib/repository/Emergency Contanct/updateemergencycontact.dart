import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Screen/emergency_contacts/emergency_contact_list.dart';
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/updatecontact.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class UpdateEmergergencyContact {
  Future<void> updateemergencyrepo(UpdateContact update) async {
    try {
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Construct request body
      Map<String, dynamic> requestBody = {
        "contactId": update.contactId ,
        "contactName": update.contactName,
        "status": update.contactEmail,
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
        Uri.parse('$apiUrl/contact'),
        headers: headers,
        body: requestBodyJson,
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
            showSnackkBar(
          message: 'Emergency contact updated successfully',
          title: 'updated',
          icon: const Icon(Icons.update),
        );
        Get.offAll(() => const EmergencycontlistW());
        log('EmergencyContanct Updated successfully.');
      } else {
           showSnackkBar(
          message: 'Emergency contact not updated successfully',
          title: ' not updated',
          icon: const Icon(Icons.error),
        );
        throw Exception(
            'Failed to update EmergencyContanct: ${response.reasonPhrase}');
      }
    } catch (e) {
       showSnackkBar(
          message: 'Emergency contact not updated successfully',
          title: ' not updated',
          icon: const Icon(Icons.error),
        );
      log('Error updating EmergencyContanct: $e');
      throw Exception('Failed to update EmergencyContanct: $e');
    }
  }
}
