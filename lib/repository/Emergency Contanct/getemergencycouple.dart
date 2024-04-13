import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Emergency%20Contanct/getcontact.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class GetContactdetailsrepocouple {
  
  Future<List<Getcontact>> getcontactrepocouple(int id) async {
  try {
    final response = await http.get(
      Uri.parse('$apiUrl/contact?user=$id'),
      headers: createAuthorizationHeaders(await TokenManager.getToken()),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      
      // Check if the jsonResponse is a List<dynamic>
      List<Getcontact> getcontact = jsonResponse
          .map((item) => Getcontact.fromJson(item))
          .toList();
      
      return getcontact;
        } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to fetch the contact: $e');
  }
}

}
