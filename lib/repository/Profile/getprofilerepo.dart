import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class GetProfileRepo {
  Future<GetprofileModel> getProfile() async {
    final headers = createAuthorizationHeaders(await TokenManager.getToken());
    final response = await http.get(
      Uri.parse('$apiUrl/user/current'),
      headers: headers,
    );
    
    if (response.statusCode == 200) {
      try {
        
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return GetprofileModel.fromJson(jsonData);
      } catch (e) {
        throw Exception('Failed to parse JSON data: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
