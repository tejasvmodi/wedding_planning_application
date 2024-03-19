import 'dart:convert';
import 'dart:developer';
import 'package:wedding_planning_application/models/content.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/models/servicemodel.dart';
import 'package:wedding_planning_application/util/constant.dart';

class ServiceRepo {
  Future<Content<List<Service>>> getService(int servicecategoryId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/service/category?category=$servicecategoryId'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Service> service = [];

        service = (jsonResponse['items'] as List<dynamic>).map((value) {

          return Service.fromJson(value);
        }).toList();

        return Content<List<Service>>(
          items: service,
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
