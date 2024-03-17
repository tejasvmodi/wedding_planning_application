import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/variation.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Util/constant.dart';

class VariationRepo<T> {
  Future<Content<List<variation>>> fetchData1(String categoryId) async {
    final response = await http.get(
      Uri.parse('$apiUrl/variation/category?category=$categoryId'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );

    try {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<variation> variations = [];

      variations = (jsonResponse['items'] as List<dynamic>).map((value) {
        return variation.fromJson(value) as variation;
      }).toList();

      return Content<List<variation>>(
        items: variations,
        total: jsonResponse['total'],
        page: jsonResponse['page'],
        perPage: jsonResponse['perPage'],
        totalPages: jsonResponse['totalPages'],
      );
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load data');
    }
  }
}