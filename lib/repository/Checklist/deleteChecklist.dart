import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class DeleteCheckListRepo {
  Future<void> deleteChecklistItem(int checklistId) async {
    try {
      String? token = await TokenManager.getToken();
      if (token == null) {
        throw Exception('Failed to get authentication token.');
      }

      var response = await http.delete(
        Uri.parse('$apiUrl/checklist/$checklistId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json', 
        },
      );

      if (response.statusCode == 200) {
        log('Checklist item deleted successfully.');
      } else {
        throw Exception('Failed to delete checklist item: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error deleting checklist item: $e');
      throw Exception('Failed to delete checklist item: $e');
    }
  }
}
