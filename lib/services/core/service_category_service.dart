import 'package:get/get.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/repository/Vendor/service_category_repo.dart';

class ServicecategoryService {
  static ServicecategoryService get instance => Get.find();

  final ServiceCategoryRepository categoryRepo = Get.find();

  Future<Content<List<ServiceCategory>>> getServicecategories() async {
    return await categoryRepo.getcategories();
  }
}
