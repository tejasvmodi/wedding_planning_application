import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planning_application/Screen/other_screens/budget.dart';
import 'package:wedding_planning_application/Util/utils.dart';
import 'package:wedding_planning_application/models/token_manager.dart';
import 'package:wedding_planning_application/util/constant.dart';

class Deletebudgetrepo{
    Future<void> deletebudget(int id) async {
    String? token = await TokenManager.getToken();
    final url = Uri.parse('$apiUrl/budget/$id');
    final request = http.Request('DELETE', url);
    request.headers.addAll(createAuthorizationHeaders(token));

    try {
      final response = await request.send();
        showSnackkBar(
          message: 'item removed successfully',
          title: 'Updated',
          icon: const Icon(Icons.delete),
        );
        Get.offAll(() => const Budget());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log(await response.stream.bytesToString());
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}