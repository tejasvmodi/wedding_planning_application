import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/servicemodel.dart';
import 'package:wedding_planning_application/repository/vendor/serviceRepo.dart';

class ServiceList{
  final ServiceRepo servicerepo = ServiceRepo();


Future<Content<List<Service>>> getVariationOptions(
      int servicecategoryid) async {
    return await servicerepo.getService(servicecategoryid);
  }
}