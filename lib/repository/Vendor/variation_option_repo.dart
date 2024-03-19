import 'dart:convert';
import 'dart:developer';
import 'package:wedding_planning_application/models/content.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/models/variation_option.dart';
import 'package:wedding_planning_application/util/constant.dart';

class VariationoptionOptionRepository {

  Future<Content<List<VariationOption>>> getVariationOptions(
      int variation) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/variation-option/variation?variation=$variation'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<VariationOption> variationoptionmodels = [];

        for (var value in (jsonResponse['items'] as List<dynamic>)) {
          variationoptionmodels.add(VariationOption.fromJson(value));
        }

        return Content<List<VariationOption>>(
          items: variationoptionmodels,
          total: jsonResponse['total'],
          page: jsonResponse['page'],
          perPage: jsonResponse['perPage'],
          totalPages: jsonResponse['totalPages'],
        );
      } else {
        // Handle non-200 status code
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle other exceptions
      log(e.toString());
      throw Exception('Failed to load data');
    }
  }
}
