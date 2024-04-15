import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/repository/getuserinfo.dart';

class Getuserinfo{
  final getUserinfo userifo = getUserinfo();
  Future<getUserName> getUserInfo(int userid) async{
    return await userifo.getuserinfo(userid);
  }
}