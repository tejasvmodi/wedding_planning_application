import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/getvendorbyserviceitem.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';
class GetVendorbyService {
  Future<List<GetVendorServiceitem>> getBookingRepo() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/vendor/service-item/2'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        log(response.body.toString());
        final List<dynamic> jsonResponse = json.decode(response.body);
        List<GetVendorServiceitem> getVendors = jsonResponse.map((item) =>
            GetVendorServiceitem.fromMap(item as Map<String, dynamic>)).toList();

        return getVendors;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to fetch the booking: $e');
    }
  }
}