import 'package:get/get.dart';
import 'package:wedding_planning_application/models/content.dart';
import 'package:wedding_planning_application/models/variation_option.dart';
import 'package:wedding_planning_application/repository/Vendor/variation_option_repo.dart';

class VariationOptionService {
  final VariationoptionOptionRepository optionRepository = Get.find();
  static VariationOptionService get instance => Get.find();

  Future<Content<List<VariationOption>>> getVariationOptions(
      int variation) async {
    return await optionRepository.getVariationOptions(variation);
  }
}
