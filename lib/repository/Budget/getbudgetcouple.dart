

import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Budget/getbudget.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';
class Getbudgetrepocouple{
  Future<List<Getbudget>> getbudgetrepocouple(int id) async {
  try {
  final response = await http.get(
    Uri.parse('$apiUrl/budget?user=$id'),
    headers: createAuthorizationHeaders(await TokenManager.getToken()),
  );

  // log('Response Body Type: ${response.body.runtimeType}');
  // log('Response Body: ${response.body}');
  
  if (response.statusCode == 200) {
    final List<dynamic> jsonResponse = json.decode(response.body);
    // log('Parsed Response: $jsonResponse');

    List<Getbudget> getbudget = jsonResponse
        .map((item) => Getbudget.fromMap(item as Map<String, dynamic>))
        .toList();
    // log('Parsed Bookings: $getbudget');
    
    return getbudget;
  } else {
    throw Exception('Failed to load data: ${response.statusCode}');
  }
} catch (e) {
  log('Error: $e');
  throw Exception('Failed to fetch the budget: $e');
}


  }
}