import 'dart:developer';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class GetCheckListrepocouple {
  Future<List<Getchecklist>> getChecklistcouple(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/checklist?user=$id'),
        headers: createAuthorizationHeaders(await TokenManager.getToken()),
      );
        log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        log(jsonResponse.toString());

        // Check if the jsonResponse is a List<dynamic>
        // if (jsonResponse is List) {
          List<Getchecklist> getChecklist = jsonResponse
              .map((item) => Getchecklist.fromJson(item))
              .toList();
          
          return getChecklist;
        // } else {
        //   throw Exception('Response is not a List');
        // }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching checklist: $e');
      throw Exception('Failed to fetch checklist: $e');
    }
  }
}
