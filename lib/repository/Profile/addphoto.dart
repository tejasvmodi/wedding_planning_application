import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class MyRepository {
  Future<void> uploadFile(XFile file) async {
    try {
      String? token = await TokenManager.getToken();

      // Create the HTTP request
      var request =
          http.MultipartRequest('POST', Uri.parse('$apiUrl/user/avatar'));

      // Set the authorization header
      request.headers['Authorization'] = 'Bearer $token';

      request.files.add(await http.MultipartFile.fromPath(
        'file', // Form field name for the file
        file.path, // Path of the selected image
      ));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
        log('File uploaded successfully.');
        showSnackkBar(
          message: 'Photo change successfully',
          title: 'Complete',
          icon: const Icon(Icons.update),
        );
      } else {
        log(response.reasonPhrase.toString());
          showSnackkBar(
          message: 'Photo  not change ',
          title: 'not Complete',
          icon: const Icon(Icons.update),
        );
        throw Exception('Failed to upload file.');
      }
    } catch (e) {
      log('Error uploading file: $e');
      throw Exception('Failed to upload file: $e');
    }
  }
}
