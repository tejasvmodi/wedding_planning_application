import 'dart:convert';
import 'dart:developer';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';


class Getnspirationrepo{
   Future<Content<List<inspirationModel>>> getInspation() async {
    final response = await http.get(
      Uri.parse('$apiUrl/inspiration'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );

     if (response.statusCode == 200) {
      log(response.body.toString());
      try {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<inspirationModel> getInspiration = [];

        getInspiration = (jsonResponse['items'] as List<dynamic>).map((value) {
          return inspirationModel.fromJson(value);
        }).toList();
      
        // log(getInspiration.toString());
        return Content<List<inspirationModel>>(
          items: getInspiration,
          total: jsonResponse['total'],
          page: jsonResponse['page'],
          perPage: jsonResponse['perPage'],
          totalPages: jsonResponse['totalPages'],
        );
      } catch (e) {
        log(e.toString());
        throw Exception('Failed to parse JSON data');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}