
import 'dart:io';

import 'package:wedding_planning_application/models/Inspiration/addinspirationmodel.dart';
import 'package:wedding_planning_application/repository/Inspiration/addinspirationrepo.dart';

class InspirationSefrvice{
  AddInspirationrepo addinspiration = AddInspirationrepo();
    Future<void> addinspiratinserv(File file,
     String description,
    List<String> tags, ) async {
      await addinspiration.addInspiration(Addinspirationmodel(file: file, description: description, tags: tags));
    
  
  }
}