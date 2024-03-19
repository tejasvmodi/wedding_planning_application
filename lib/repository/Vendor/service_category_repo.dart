import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class ServiceCategoryRepository {
  Future<Content<List<ServiceCategory>>> getcategories() async {
    final response = await http.get(Uri.parse('$apiUrl/service-category'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()));

    try {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);

      List<ServiceCategory> items = [];

      for (var value in (jsonResponse['items'] as List<dynamic>)) {
        items.add(ServiceCategory.fromJson(value));
      }

      return Content<List<ServiceCategory>>(
        items: items,
        total: jsonResponse['total'],
        page: jsonResponse['page'],
        perPage: jsonResponse['perPage'],
        totalPages: jsonResponse['totalPages'],
      );
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
