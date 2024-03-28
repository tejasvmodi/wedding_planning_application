import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/repository/Inspiration/getinsprationrepo.dart';

class Getinspiration{
   Getnspirationrepo getinspirationw = Getnspirationrepo();
   Future<Content<List<inspirationModel>>> getInspiration() async{
    return await getinspirationw.getInspation();
   }
}