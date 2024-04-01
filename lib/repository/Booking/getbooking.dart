
import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Getbookingrepo {
  Future<List<GetBookings>> getbookingrepo() async {
  try {
  final response = await http.get(
    Uri.parse('$apiUrl/booking'),
    headers: createAuthorizationHeaders(await TokenManager.getToken()),
  );

  // log('Response Body Type: ${response.body.runtimeType}');
  // log('Response Body: ${response.body}');
  
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    // log('Parsed Response: $jsonResponse');

    List<GetBookings> getbooking = jsonResponse
        .map((item) => GetBookings.fromMap(item as Map<String, dynamic>))
        .toList();
    // log('Parsed Bookings: $getbooking');
    
    return getbooking;
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
} catch (e) {
  log('Error: $e');
  throw Exception('Failed to fetch the booking: $e');
}


  }
}
