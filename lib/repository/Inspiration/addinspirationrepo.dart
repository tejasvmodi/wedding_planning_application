import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Inspiration/addinspirationmodel.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class AddInspirationrepo {
  Future<void> addInspiration(Addinspirationmodel add) async {
    try {
      // Retrieve the token
      String? token = await TokenManager.getToken();
      
      // Create the HTTP request
      var request = http.MultipartRequest('POST', Uri.parse('$apiUrl/inspiration'));
      
      // Set the authorization header
      request.headers['Authorization'] = 'Bearer $token';
      
      // Add form fields
      request.fields.addAll({
        'description': add.description,
        'tags[]': add.tags.join(','), // Join the tags array into a comma-separated string
      });

      // Add the image file
      request.files.add(http.MultipartFile(
        'image',
        add.file.openRead(),
        await add.file.length(),
        filename: add.file.path.split('/').last,
      ));

      // Send the request
      var response = await request.send();
      
      // Check the response status code
      if (response.statusCode == 200) {
        log('Inspiration added successfully.');
      } else {
        throw Exception('Failed to add inspiration: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding inspiration: $e');
      throw Exception('Failed to add inspiration: $e');
    }
  }
}
