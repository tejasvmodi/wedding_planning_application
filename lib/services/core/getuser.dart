import 'package:get/get.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/repository/Profile/getprofilerepo.dart';

class GetUser {
  final GetProfileRepo profilerepo = Get.find();
  
  Future<GetprofileModel> getUserProfile() async {
    return await profilerepo.getProfile();
  }
}
