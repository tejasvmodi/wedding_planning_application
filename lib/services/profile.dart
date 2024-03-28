import 'package:get/get.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/services/core/getuser.dart';
import 'package:wedding_planning_application/services/core/getuserinfo.dart';

class ProfileService {
  final GetUser user = Get.find();
  final Getuserinfo userinfo = Get.find();
 
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

  Future<List<getUserName>> getuserinformation(int userid) async {
    List<getUserName> getuserinformation = [];
    try{
      getUserName? userinfor = await userinfo.getUserInfo(userid);
      getuserinformation.add(userinfor);
    }catch(e){
      print(e);
    }
   
    return getuserinformation;
  }
}
