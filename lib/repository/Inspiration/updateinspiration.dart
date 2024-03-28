import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/Inspiration/updateinspirationmodel.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class UpdateInspirationrepo {
  Future<void> updateInspiration(updateinspiratiojn update) async {
    try {
      String? token = await TokenManager.getToken();

      var request =
          http.MultipartRequest('PUT', Uri.parse('$apiUrl/inspiration'));

      request.headers['Authorization'] = 'Bearer $token';

      request.fields.addAll({
        'inspirationId': update.inspirationId.toString(),
        'description': update.description,
        'tags[]': update.tags.join(','),
      });

      request.files.add(http.MultipartFile(
        'image',
        update.filename.openRead(),
        await update.filename.length(),
        filename: update.filename.path.split('/').last,
      ));

      var response = await request.send();
        log(response.statusCode.toString());
      if (response.statusCode == 200) {
        
        log('Inspiration Updated successfully.');
      } else {
        throw Exception('Failed to add inspiration: ${response.reasonPhrase}');
      }
    } catch (e) {
      log('Error in updating the  inspiration: $e');
      throw Exception('Failed to update inspiration: $e');
    }
  }
}
