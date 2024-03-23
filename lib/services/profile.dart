import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/services/core/getuser.dart';

class ProfileService {
  final GetUser user = Get.find();
 
  Future<List<GetprofileModel>> getprofile() async {
    List<GetprofileModel> profile = []; 
    try {
      // Wait for the getUserProfile() method call to complete and then add the result to the profile list
      GetprofileModel? userProfile = await user.getUserProfile();
      if (userProfile != null) {
        profile.add(userProfile);
      }
    } catch (e) {
      print(e);
    }
  
    log(profile.toString());
    return profile;
  }
}
