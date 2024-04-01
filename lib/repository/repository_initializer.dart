import 'package:get/get.dart';
import 'package:wedding_planning_application/repository/Checklist/addChecklist.dart';
import 'package:wedding_planning_application/repository/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/repository/Emergency%20Contanct/addemergencycontact.dart';
import 'package:wedding_planning_application/repository/Inspiration/addinspirationrepo.dart';
import 'package:wedding_planning_application/repository/Inspiration/deleteinspration.dart';
import 'package:wedding_planning_application/repository/Inspiration/getinsprationrepo.dart';
import 'package:wedding_planning_application/repository/Inspiration/updateinspiration.dart';
import 'package:wedding_planning_application/repository/Profile/getprofilerepo.dart';
import 'package:wedding_planning_application/repository/getuserinfo.dart';
import 'package:wedding_planning_application/repository/vendor/serviceItemrepo.dart';
import 'package:wedding_planning_application/repository/vendor/serviceRepo.dart';
import 'package:wedding_planning_application/repository/vendor/service_category_repo.dart';
import 'package:wedding_planning_application/repository/vendor/variation_option_repo.dart';
import 'package:wedding_planning_application/repository/vendor/variation_repo.dart';
import 'package:wedding_planning_application/repository/authentication/authentication_repository.dart';


class RepositoryInitializer {
  RepositoryInitializer() {
    Get.lazyPut(() => AuthenticationRepository());
    Get.lazyPut(() => ServiceCategoryRepository());
    Get.lazyPut(() => VariationoptionOptionRepository());
    Get.lazyPut(() => ServiceRepo());
    Get.lazyPut(() => ServiceItemRepo());
    Get.lazyPut(() => GetProfileRepo());
    Get.lazyPut(() => AddInspirationrepo());
    Get.lazyPut(() => Getnspirationrepo());
    Get.lazyPut(() => UpdateInspirationrepo());
    Get.lazyPut(() => getUserinfo());
    Get.lazyPut(() =>  Deleteinspirationrepo());
    Get.lazyPut(() => AddInspirationrepo());
    Get.lazyPut(() => AddCheckListrepo());
    Get.lazyPut(() => GetCheckListrepo());
    Get.lazyPut(() => Deleteinspirationrepo());
    Get.lazyPut(() => AddEmergergencyContact());
        Get.lazyPut(() => VariationRepository());
  }
}
