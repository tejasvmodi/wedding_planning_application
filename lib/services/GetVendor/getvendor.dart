import 'dart:developer';

import 'package:wedding_planning_application/models/GetVendor/getvendorbyserviceitem.dart';
import 'package:wedding_planning_application/repository/vendor/getvendorbyserviceitem.dart';

class GetVendorService{
  GetVendorbyService  service = GetVendorbyService();
  Future<List<GetVendorServiceitem>> getvendordata(int id) async{
   List<GetVendorServiceitem> getvendorserviceitems = [];
    try{
        getvendorserviceitems = await service.getBookingRepo(id);
    }catch(e){
      log(e.toString());
    }
    log(getvendorserviceitems.toString());
   return getvendorserviceitems;
 }
}