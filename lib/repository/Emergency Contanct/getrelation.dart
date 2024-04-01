import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Emergency%20Contanct/getrelation.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Relationshiprepo {
  Future<List<Relation>> getrelationrepo() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/relation'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );
      // log(jsonEncode(response.body));
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        // log(jsonResponse.toString());

        List<Relation> relation = jsonResponse
              .map((item) => Relation.fromMap(item))
              .toList();
          log(relation.toString());
        return relation;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching the relation: $e');
      throw Exception('Failed to fetch the relation: $e');
    }
  }
}
