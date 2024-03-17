import 'package:get/get.dart';
import 'package:wedding_planning_application/models/data/vendor_data.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';
import 'package:wedding_planning_application/services/core/variation_option_service.dart';
import 'package:wedding_planning_application/services/core/variation_service.dart';

class VendorService {
  static VendorService get instance => Get.find();
  final ServicecategoryService categoryService = Get.find();
  final VariationService variationService = Get.find();
  final VariationOptionService variationOptionService = Get.find();

  Future<List<VendorData>> getVendorData() async {
    List<VendorData> vendorData = [];
    await categoryService.getServicecategories().then((data) async {
      for (ServiceCategory category in data.items) {
        await variationService
            .getVariations(category.serviceCategoryId)
            .then((variations) async {
          for (var variation in variations.items) {
            await variationOptionService
                .getVariationOptions(variation.variationId)
                .then((optionItems) {
              vendorData.add(VendorData(
                  category: category, variationOptions: optionItems.items));
            });
          }
        });
      }
    });
    return vendorData;
  }
}
