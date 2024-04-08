import 'dart:developer';

import 'package:wedding_planning_application/models/Address/addAdress.dart';
import 'package:wedding_planning_application/models/Address/citymodel.dart';
import 'package:wedding_planning_application/models/Address/statemdel.dart';
import 'package:wedding_planning_application/repository/address/addaddress.dart';
import 'package:wedding_planning_application/repository/address/getcityrepo.dart';
import 'package:wedding_planning_application/repository/address/getstaterepo.dart';

class AddressService {
  final Getstaterepo get = Getstaterepo();
  final Getcityrepo city = Getcityrepo();
  final AddAddress add = AddAddress();
  Future<List<StateModel>> getstate() async {
    List<StateModel> state = [];
    try {
      state = await get.getstaterepo();
    } catch (e) {
      log(e.toString());
    }

    return state;
  }

  Future<List<CityModel>> getcity(int id) async {
    List<CityModel> getc = [];
    try {
      getc = await city.getcityrepo(id);
    } catch (e) {
      log(e.toString());
    }

    return getc;
  }

  Future<void> addadress(String address1, String address2, int id) async {
    AddAdress adda = AddAdress(
      addressLine1: address1,
      addressLine2: address2,
      cityInfo: CityModel(cityId: id, cityName: null),
    );
    await add.addbudgetrepo(adda);
  }
}
