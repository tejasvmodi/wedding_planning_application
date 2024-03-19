import 'package:get/get.dart';
import 'package:wedding_planning_application/services/authentication/auth_service.dart';
import 'package:wedding_planning_application/services/core/service.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';
import 'package:wedding_planning_application/services/core/variation_option_service.dart';
import 'package:wedding_planning_application/services/core/variation_service.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';

class ServiceInitializer {
  ServiceInitializer() {
    Get.lazyPut(() => AuthenticationService());
    Get.lazyPut(() => ServicecategoryService());
    Get.lazyPut(() => VariationService());
    Get.lazyPut(() => VariationOptionService());
    Get.lazyPut(() => VendorService());
    Get.lazyPut(() => ServiceList());
  }
}
