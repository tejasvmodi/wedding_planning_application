
import 'dart:developer';
import 'dart:io';
import 'package:wedding_planning_application/models/Inspiration/addinspirationmodel.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/repository/Inspiration/addinspirationrepo.dart';
import 'package:wedding_planning_application/services/core/deleteinspiration.dart';
import 'package:wedding_planning_application/services/core/getinspiration.dart';

class InspirationSefrvice{
  AddInspirationrepo addinspiration = AddInspirationrepo();
  final Getinspiration getinspiration = Getinspiration();
  final Deleteinspiration deleteins =Deleteinspiration();
 
    Future<void> addinspiratinserv(File file,
     String description,
    List<String> tags, ) async {
      await addinspiration.addInspiration(Addinspirationmodel(file: file, description: description, tags: tags));
  }


Future<List<inspirationModel>> getallinspiration() async {
  List<inspirationModel> getinspi = [];
   
  try {
  
    await getinspiration.getInspiration().then((inspirationm) async{
      getinspi.addAll(inspirationm.items);
    });
  } catch (e) {
  
     log('Error fetching service data: $e');
  }
      
  // log(getinspi.toString());
  return getinspi;
}

Future<void> updateinspiration() async {
  
}

Future<void> deleteinspirationservice(int id) async {
   try{
          deleteins.deleteinspiration(id);
   }catch (e) {
    log(e.toString());
   }
}

}