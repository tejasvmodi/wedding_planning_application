
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Booking/showBooking.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';
class Getservicesinglerepo {
  Future<Showbooking> fetchServiceItem(int serviceitemid) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/service-item/$serviceitemid'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        
        // Parse the single object into a Showbooking object
        Showbooking booking = Showbooking.fromMap(jsonResponse);
        // log(booking.toString());
        return booking;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch service item: $e');
    }
  }
}
