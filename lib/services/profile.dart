import 'dart:developer';
import 'package:wedding_planning_application/models/ProfileModels/addprofileeinformation.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/repository/Profile/updatepersonalinfo.dart';
import 'package:wedding_planning_application/services/core/getuser.dart';
import 'package:wedding_planning_application/services/core/getuserinfo.dart';

class ProfileService {
  final GetUser user = GetUser();
  final Getuserinfo userinfo = Getuserinfo();
  final Updatepersoninfo update = Updatepersoninfo();
 
  Future<List<GetprofileModel>> getprofile() async {
    List<GetprofileModel> profile = []; 
    try {
      GetprofileModel? userProfile = await user.getUserProfile();
      profile.add(userProfile);
        } catch (e) {
log(e.toString());
    }
  
    return profile;
  }

  Future<List<getUserName>> getuserinformation(int userid) async {
    List<getUserName> getuserinformation = [];
    try{
      getUserName? userinfor = await userinfo.getUserInfo(userid);
      getuserinformation.add(userinfor);
    }catch(e){
      log(e.toString());
    }
   
    return getuserinformation;
  }

  Future<void> updateuser(int id,String Firstname,String lastName,String email,String phone) async {
   update.updateprofilerepo(Addprofile(userId: id, firstName: Firstname, lastName: lastName, email: email, phone: phone));
  }
}
