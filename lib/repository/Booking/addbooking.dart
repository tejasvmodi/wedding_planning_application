import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Booking/addbooking.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class AddBookingrepo{
   Future<void> addbookingrepo(AddBooking add) async {
 
    try {
         log(add.bookingPrice.toString());
         log(add.bookedService.toString());
         log(add.eventDate.toString());
      // Get token
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      // Construct request body
      Map<String, dynamic> requestBody = {
         'bookingPrice':add.bookingPrice,
         'eventDate':add.eventDate,
         'bookedService':add.bookedService
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
        Uri.parse('$apiUrl/booking'),
        headers: headers,
        body: requestBodyJson,
      );

      // Check the response status code
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        log('Booking  added successfully.');
      } else {
        throw Exception('Failed to add Booking : ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error adding Booking : $e');
      throw Exception('Failed to add Booking : $e');
    }
  }
}