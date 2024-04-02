import 'dart:developer';

import 'package:wedding_planning_application/models/Address/citymodel.dart';
import 'package:wedding_planning_application/models/Address/statemdel.dart';
import 'package:wedding_planning_application/repository/address/getcityrepo.dart';
import 'package:wedding_planning_application/repository/address/getstaterepo.dart';

class AddressService{
  final Getstaterepo get= Getstaterepo();
  final Getcityrepo city = Getcityrepo();
  Future<List<StateModel>> getstate() async{
    List<StateModel> state = [];
    try{
        state = await get.getstaterepo();
    }catch(e){
      log(e.toString());
    }
  
    return state;
  }
  
   Future<List<CityModel>> getcity() async{
    List<CityModel> getc = [];
    try{
        getc = await city.getcityrepo();
    }catch(e){
      log(e.toString());
    }
 
    return getc;
   }
}