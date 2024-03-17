import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/variation.dart';
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Util/constant.dart';

class VariationRepository {
  static VariationRepository get instance => Get.find();

  Future<Content<List<Variation>>> getvariations(int category) async {
    final response = await http.get(
      Uri.parse('$apiUrl/variation/category?category=$category'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );

    try {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<Variation> variations = [];

      variations = (jsonResponse['items'] as List<dynamic>).map((value) {
        return Variation.fromJson(value);
      }).toList();

      return Content<List<Variation>>(
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
