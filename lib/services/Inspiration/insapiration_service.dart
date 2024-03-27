
import 'dart:developer';
import 'dart:io';

import 'package:wedding_planning_application/models/Inspiration/addinspirationmodel.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/repository/Inspiration/addinspirationrepo.dart';
import 'package:wedding_planning_application/repository/Inspiration/getinsprationrepo.dart';

class InspirationSefrvice{
  AddInspirationrepo addinspiration = AddInspirationrepo();
  Getnspirationrepo getinspiration = Getnspirationrepo();
    Future<void> addinspiratinserv(File file,
     String description,
    List<String> tags, ) async {
      await addinspiration.addInspiration(Addinspirationmodel(file: file, description: description, tags: tags));
  }


Future<List<inspirationModel>> getallinspiration() async {
  List<inspirationModel> getinspi = [];
   
  try {
  
    await getinspiration.getInspation().then((inspirationm) async{
      getinspi.addAll(inspirationm.items);
    });
  } catch (e) {
  
     log('Error fetching service data: $e');
  }
      
  // log(getinspi.toString());
  return getinspi;
}


}