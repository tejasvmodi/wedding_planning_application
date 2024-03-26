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
      try {
        log(response.body);
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<inspirationModel> getinspiration= [];

       getinspiration.addAll(jsonResponse.toString() as Iterable<inspirationModel>);

        return Content<List<inspirationModel>>(
          items: getinspiration,
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