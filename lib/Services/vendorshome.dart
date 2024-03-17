import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/service_category.dart';
import 'package:wedding_planning_application/Models/variation.dart';
import 'package:wedding_planning_application/Repository/Vendor/service_category.dart';
import 'package:wedding_planning_application/Repository/Vendor/variation.dart';

class VendorsHome {
  VariationRepo varrepo = VariationRepo();
  List<service_Category> items = [];
  List<variation> variations = [];

  Future<void> fetchData() async {
    final repository = ContentRepository<service_Category>();

    try {
      final Content<List<service_Category>> content = await repository.fetchData();
      items.addAll(content.items);

      // Iterate over each service category and fetch data for variations
      for (service_Category category in items) {
        await varrepo.fetchData1(category.serviceCategoryId.toString());
      }
    } catch (e) {
      print('$e');
    }
  }

  Future<void> getVariations() async{
    final variationitem = ContentRepository<variation>();
    try {
      final Content<List<variation>> contentvariation = (await variationitem.fetchData()) as Content<List<variation>>;
      variations.add(contentvariation.items as variation);
        
      // Iterate over each variation and fetch data for variations
      for (variation variation in variations) {
        await varrepo.fetchData1(variation.variationId.toString());
      }
    }catch (e) {
      print('$e');
  }
}
}
