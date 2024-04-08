import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Address/statemdel.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Getstaterepo {
  Future<List<StateModel>> getstaterepo() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/states'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        // log('Parsed Response: $jsonResponse');

        List<StateModel> getstate = jsonResponse
            .map((item) => StateModel.fromMap(item as Map<String, dynamic>))
            .toList();
        // log('Parsed Bookings: $getstate');

        return getstate;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
      throw Exception('Failed to fetch the booking: $e');
    }
  }
}