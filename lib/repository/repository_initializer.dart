import 'package:get/get.dart';
import 'package:wedding_planning_application/repository/vendor/serviceRepo.dart';
import 'package:wedding_planning_application/repository/vendor/service_category_repo.dart';
import 'package:wedding_planning_application/repository/vendor/variation_option_repo.dart';
import 'package:wedding_planning_application/repository/vendor/variation_repo.dart';
import 'package:wedding_planning_application/repository/authentication/authentication_repository.dart';

class RepositoryInitializer {
  RepositoryInitializer() {
    Get.lazyPut(() => AuthenticationRepository());
    Get.lazyPut(() => ServiceCategoryRepository());
    Get.lazyPut(() => VariationRepository());
    Get.lazyPut(() => VariationoptionOptionRepository());
    Get.lazyPut(() => ServiceRepo());
  }
}
