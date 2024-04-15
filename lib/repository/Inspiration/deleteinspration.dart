import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/Util/utils.dart';
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
          showSnackkBar(
          message: 'inspiration deleted successfully',
          title: 'Complete',
          icon: const Icon(Icons.delete),
        );
        Get.offAll(()=>ScreenNavigation(currentIndex: 3,));
      } else {
         showSnackkBar(
          message: 'inspiration  not deleted successfully',
          title: 'not complete',
          icon: const Icon(Icons.error),
        );
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
