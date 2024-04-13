import 'dart:developer';
import 'package:wedding_planning_application/models/Checklist/addchecklist.dart';
import 'package:wedding_planning_application/models/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/models/Checklist/updatechecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/addChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/checklistcouple.dart';
import 'package:wedding_planning_application/repository/Checklist/deleteChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/updatechecklist.dart';

class CheckListService{
  final AddCheckListrepo  add = AddCheckListrepo();
  final GetCheckListrepo  get = GetCheckListrepo();
  final GetCheckListrepocouple getcouple = GetCheckListrepocouple();
  final DeleteCheckListRepo del = DeleteCheckListRepo();
  final UpdateCheckListrepo upd = UpdateCheckListrepo();
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

  
  Future<List<Getchecklist>> getCheckListcouple(int id) async{
    List<Getchecklist> getcheckcouple = [];
    try{
    getcheckcouple = await getcouple.getChecklistcouple(id);
    }catch(e){
      log(e.toString());
    }
    return getcheckcouple;
  }


  Future<void> updatechecklist(int checklistid,String status) async{
    await upd.updateChecklistrepo(Updaatechecklist(checklistId: checklistid.toString(), status: status));
  }

  Future<void> deleteCheckList(int id) async{
   del.deleteChecklistItem(id);   
  }
}