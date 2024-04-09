import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/GetVendor/getvendorbyserviceitem.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class GetVendorbyService {
  Future<List<GetVendorServiceitem>> getBookingRepo(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/vendor/service-item/$id'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        log(response.body.toString());

        dynamic jsonResponse = json.decode(response.body);

        // Check if the response is a single object or a list
        if (jsonResponse is List) {
          // Map the JSON objects to GetVendorServiceitem objects
          List<GetVendorServiceitem> items = jsonResponse
              .map((item) => GetVendorServiceitem.fromMap(item.cast<String, dynamic>())) // Cast the keys to String
              .toList();
          return items;
        } else if (jsonResponse is Map) {
          // Handle the case where the response is a single object
          GetVendorServiceitem item = GetVendorServiceitem.fromMap(jsonResponse.cast<String, dynamic>()); // Cast the keys to String
          return [item];
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to fetch the booking: $e');
    }
  }
}
