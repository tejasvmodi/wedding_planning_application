import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class DeleteContactRepo {
  Future<void> deleteContact(int deleteionId) async {
    try {
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      var response = await http.delete(
        Uri.parse('$apiUrl/contact/$deleteionId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', 
        },
      );

      if (response.statusCode == 200) {
        log('Contact item deleted successfully.');
      } else {
        throw Exception('Failed to delete Contact item: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error deleting Contact item: $e');
      throw Exception('Failed to delete Contact item: $e');
    }
  }
}
