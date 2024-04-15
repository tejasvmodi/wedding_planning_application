import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/repository/Profile/getprofilerepo.dart';

class GetUser{
  final GetProfileRepo profilerepo = GetProfileRepo();
  
  Future<GetprofileModel> getUserProfile() async {
    return await profilerepo.getProfile();
  }   
}
