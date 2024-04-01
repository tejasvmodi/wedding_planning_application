import 'dart:developer';
import 'package:wedding_planning_application/models/data/vendor_data.dart';
import 'package:wedding_planning_application/models/service_itemmodel.dart';
import 'package:wedding_planning_application/models/servicemodel.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/models/variation_option.dart';
import 'package:wedding_planning_application/services/core/service.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';
import 'package:wedding_planning_application/services/core/service_item.dart';
import 'package:wedding_planning_application/services/core/variation_option_service.dart';
import 'package:wedding_planning_application/services/core/variation_service.dart';

class VendorService {
  final ServicecategoryService categoryService = ServicecategoryService();
  final VariationService variationService = VariationService();
  final VariationOptionService variationOptionService = VariationOptionService();
  final ServiceList servicelist = ServiceList();
  final Serviceitem serviceitem = Serviceitem(); 

  Future<List<VendorData>> getVendorData() async {
    List<VendorData> vendorData = [];
    await categoryService.getServicecategories().then((data) async {
      for (ServiceCategory category in data.items) {
        List<VariationOption> options = [];
        await variationService
            .getVariations(category.serviceCategoryId)
            .then((variations) async {
          for (var variation in variations.items) {
            await variationOptionService
                .getVariationOptions(variation.variationId)
                .then((optionItems) {
              options.addAll(optionItems.items);
            });
          }
          // log(jsonEncode(options));
          vendorData.add(VendorData(
              category: category,
              variationOptions: List<VariationOption>.of(options)));
          options.clear();
          //log(jsonEncode(vendorData));
        });
      }
    });
    //log(jsonEncode(vendorData));
    return vendorData;
  }

Future<List<Service>> getServiceData(int serviceCategoryId) async {
  List<Service> serviceList = [];
   log(serviceCategoryId.toString());
  try {
  
    await servicelist.getVariationOptions(serviceCategoryId).then((serviceModels) async{
      serviceList.addAll(serviceModels.items);
    });
  } catch (e) {
  
     log('Error fetching service data: $e');
  }
      
  // log(serviceList.toString());
  return serviceList;
}

Future<List<ServiceitemModel>> getserviceitem(int serviceid) async {
    List<ServiceitemModel> servicelist = [];
    try{
        await serviceitem.getserviceitem(serviceid).then((value) async{
          servicelist.addAll(value.items);
        });
    }catch(e){
      log(e.toString());
    }
    log(servicelist.toString());
    return servicelist;
}

}
