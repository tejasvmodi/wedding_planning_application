import 'package:get/get.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/variation.dart';
import 'package:wedding_planning_application/repository/vendor/variation_repo.dart';

class VariationService {
   final VariationRepository variationRepo = Get.find();

  Future<Content<List<Variation>>> getVariations(int category) async {
    return await variationRepo.getvariations(category);
  }
}
