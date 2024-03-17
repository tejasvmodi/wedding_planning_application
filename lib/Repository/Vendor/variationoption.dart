import 'dart:convert';
import 'dart:developer';
import 'package:wedding_planning_application/Models/content.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Models/token_manager.dart';
import 'package:wedding_planning_application/Models/variationoptionmodel.dart';
import 'package:wedding_planning_application/Util/constant.dart';
class variationoptionmodelOptionRepo {
  Future<Content<List<variationoptionmodel>>> fetchData2(String VariationId) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/variation-option/variation?variation=$VariationId'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<variationoptionmodel> variationoptionmodels = [];
        // log(jsonResponse.toString());
        (jsonResponse['items'] as List<dynamic>).forEach((value) {
          variationoptionmodels.add(variationoptionmodel.fromJson(value));
        });

        return Content<List<variationoptionmodel>>(
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
