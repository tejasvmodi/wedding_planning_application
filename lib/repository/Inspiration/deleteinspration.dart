import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Deleteinspirationrepo {
  Future<void> deleteInspiration(int id) async {
    String? token = await TokenManager.getToken();
    final url = Uri.parse('$apiUrl/inspiration/$id');
    final request = http.Request('DELETE', url);
    request.headers.addAll(createAuthorizationHeaders(token));

    try {
      final response = await request.send();
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
