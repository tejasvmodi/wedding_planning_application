import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class GetCouplerepo {
  Future<List<Getcouple>> getcouple() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/user/couple'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );
      // log(response.body.toString());

      if (response.statusCode == 200) {
        final dynamic jsonResponse = json.decode(response.body);
       

        if (jsonResponse is Map<String, dynamic>) {
          
          Getcouple couple = Getcouple.fromJson(jsonResponse);
          // log(couple.toString());
          return [couple];
        } else {
          throw Exception('Response is not a Map');
        }

      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching getdata: $e');
      throw Exception('Failed to fetch getdata: $e');
    }
  }
}
