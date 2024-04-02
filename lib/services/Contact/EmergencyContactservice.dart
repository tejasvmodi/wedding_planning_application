import 'dart:developer';
import 'package:wedding_planning_application/models/Emergency%20Contanct/addcontact.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/getcontact.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/getrelation.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/updatecontact.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/addemergencycontact.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/deletecontact.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/getEmergencycontact.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/getrelation.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/updateemergencycontact.dart';

class EmergencyContactService{
  final AddEmergergencyContact emergency =  AddEmergergencyContact();
  final Relationshiprepo getRelation = Relationshiprepo();
  final GetContactdetailsrepo getcontact = GetContactdetailsrepo();
  final UpdateEmergergencyContact update = UpdateEmergergencyContact();
  final DeleteContactRepo delete = DeleteContactRepo();

  Future<void> addEmergencyService(String name,List<String> contact,String relation) async{
    await emergency.addemergencyrepo(Addcontact(contactName: name,numbers: contact,status:  relation));
  }
  Future<void> updateEmergencyService(String name,int id,String relation) async{
    await update.updateemergencyrepo(UpdateContact(contactId: id, contactName: name, contactEmail: relation));
  }


  Future<void> deleteEmergencyService(int id) async{
    await delete.deleteContact(id);
   }


  Future<List<Relation>> getrelation() async{
    List<Relation> result = [];

    try{
      result = await getRelation.getrelationrepo();
    }catch(e){
     log(e.toString());
    }
    // log(result.toString());
    return result;
  }

  Future<List<Getcontact>> getcontactservice() async {
    List<Getcontact> result = [];
    try{
      result = await getcontact.getcontactrepo();
    }catch(e) {
      log(e.toString());
    }
    // log(result.toString());
    return result;
  }
  
}