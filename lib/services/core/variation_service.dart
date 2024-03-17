import 'package:get/get.dart';
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/variation.dart';
import 'package:wedding_planning_application/repository/Vendor/variation_repo.dart';

class VariationService {
  static VariationService get instance => Get.find();
  final VariationRepository variationRepo = Get.find();

  Future<Content<List<Variation>>> getVariations(int category) async {
    return await variationRepo.getvariations(category);
  }
}
