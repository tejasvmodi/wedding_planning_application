import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/service_category.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Util/constant.dart';

class ContentRepository<T> {
  Future<Content<List<service_Category>>> fetchData() async {
    final response = await http.get(Uri.parse('$apiUrl/service-category'),headers: createAuthorizationHeaders(await TokenManager.getToken()));

    try {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      List<service_Category> items = [];

// log(jsonResponse['items'].toString());
      (jsonResponse['items'] as List<dynamic>).forEach((value) {

        items.add(service_Category.fromJson(value));  
      });
     
      return Content<List<service_Category>>(
        items: items,
        total: jsonResponse['total'],
        page: jsonResponse['page'],
        perPage: jsonResponse['perPage'],
        totalPages: jsonResponse['totalPages'],
      );
    } catch (e) {
      // log(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
