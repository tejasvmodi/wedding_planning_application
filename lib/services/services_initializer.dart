import 'package:get/get.dart';
import 'package:wedding_planning_application/services/Inspiration/insapiration_service.dart';
import 'package:wedding_planning_application/services/authentication/auth_service.dart';
import 'package:wedding_planning_application/services/core/deleteinspiration.dart';
import 'package:wedding_planning_application/services/core/getinspiration.dart';
import 'package:wedding_planning_application/services/core/getuser.dart';
import 'package:wedding_planning_application/services/core/getuserinfo.dart';
import 'package:wedding_planning_application/services/core/service.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';
import 'package:wedding_planning_application/services/core/service_item.dart';
import 'package:wedding_planning_application/services/core/updateinspiration.dart';
import 'package:wedding_planning_application/services/core/variation_option_service.dart';
import 'package:wedding_planning_application/services/core/variation_service.dart';
import 'package:wedding_planning_application/services/profile.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';

class ServiceInitializer {
  ServiceInitializer() {
    Get.lazyPut(() => AuthenticationService());
    Get.lazyPut(() => ServicecategoryService());
    Get.lazyPut(() => VariationService());
    Get.lazyPut(() => VariationOptionService());
    Get.lazyPut(() => VendorService());
    Get.lazyPut(() => ServiceList());
    Get.lazyPut(() => Serviceitem());
    Get.lazyPut(()=>GetUser());
    Get.lazyPut(() => ProfileService());
    Get.lazyPut(() => InspirationSefrvice());
    Get.lazyPut(() => Getinspiration());
    Get.lazyPut(() => Getuserinfo());
    Get.lazyPut(() => UpdateinspirationService());
    Get.lazyPut(() => Deleteinspiration());
  }
}
