import 'dart:developer';

import 'package:get/get.dart';
import 'package:wedding_planning_application/models/Checklist/addchecklist.dart';
import 'package:wedding_planning_application/models/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/addChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/deleteChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/getChecklist.dart';

class CheckListService{
  final AddCheckListrepo  add = Get.find();
  final GetCheckListrepo  get = GetCheckListrepo();
  final DeleteCheckListRepo del = DeleteCheckListRepo();
  Future<void> addcheckList(String listItem,String status) async{

      await add.addChecklistrepo(AddCheckList(listItem: listItem, status: status));
  }

  Future<List<Getchecklist>> getCheckList() async{
    List<Getchecklist> getcheck = [];
    try{
    getcheck = await get.getChecklist();
    }catch(e){
      log(e.toString());
    }
    return getcheck;
  }

  Future<void> deleteCheckList(int id) async{
   del.deleteChecklistItem(id);   
  }
}