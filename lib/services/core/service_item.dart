import 'package:get/get.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/service_itemmodel.dart';
import 'package:wedding_planning_application/repository/vendor/serviceItemrepo.dart';

class Serviceitem {
  final ServiceItemRepo serviceitem = Get.find();

  Future<Content<List<ServiceitemModel>>> getserviceitem(
      int serviceId) async {
    return await serviceitem.getitemService(serviceId);
  }
}
