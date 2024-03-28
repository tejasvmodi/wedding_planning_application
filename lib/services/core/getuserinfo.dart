import 'package:get/get.dart';
import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/repository/getuserinfo.dart';

class Getuserinfo{
  final getUserinfo userifo = Get.find();
  Future<getUserName> getUserInfo(int userid) async{
    return await userifo.getuserinfo(userid);
  }
}