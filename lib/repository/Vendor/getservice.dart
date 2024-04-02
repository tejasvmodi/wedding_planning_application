import 'dart:convert';
import 'dart:developer';
import 'package:wedding_planning_application/models/content.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/service_itemmodel.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class ServiceItemdefaultRepo {
  Future<Content<List<ServiceitemModel>>> getitemServicedefault() async {
    final response = await http.get(
      Uri.parse('$apiUrl/service-item'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );
    if (response.statusCode == 200) {
      // log(response.body);
      try {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<ServiceitemModel> service = [];

        service = (jsonResponse['items'] as List<dynamic>).map((value) {

          return ServiceitemModel.fromJson(value);
        }).toList();
        // log(service.toString());

        return Content<List<ServiceitemModel>>(
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
