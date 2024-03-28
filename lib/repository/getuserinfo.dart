import 'dart:developer';

import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';
import 'package:http/http.dart' as http;


// ignore: camel_case_types
class getUserinfo{
    Future<getUserName> getuserinfo(int userid) async {
    final response = await http.get(Uri.parse('$apiUrl/user/$userid'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()));

    if (response.statusCode == 200) {
      try {
       
        return getUserName.fromJson(response.body.toString());
      } catch (e) {
        log(e.toString());
        // log('Failed to parse JSON data$e');
        throw Exception('Failed to parse JSON data');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}