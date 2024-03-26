import 'package:get/get.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/services/core/getuser.dart';

class ProfileService {
  final GetUser user = Get.find();
 
  Future<List<GetprofileModel>> getprofile() async {
    List<GetprofileModel> profile = []; 
    try {
      GetprofileModel? userProfile = await user.getUserProfile();
      profile.add(userProfile);
        } catch (e) {
      print(e);
    }
  
    return profile;
  }
}
