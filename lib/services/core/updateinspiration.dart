import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:wedding_planning_application/models/Inspiration/updateinspirationmodel.dart';
import 'package:wedding_planning_application/repository/Inspiration/updateinspiration.dart';

class UpdateinspirationService {
  final UpdateInspirationrepo update = Get.find();
  Future<void> updateinspiration(int inspirationid, String description,
      File filename, List<String> tags) async {
             log(filename.toString()); 
        log(inspirationid.toString());
        log(description.toString());
       log(tags.toString());
    await update.updateInspiration(updateinspiratiojn(
        inspirationId: inspirationid,
        description: description,
        filename: filename,
        tags: tags));
   
  }
}
