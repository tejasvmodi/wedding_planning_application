import 'dart:developer';

import 'package:wedding_planning_application/models/Couple/Addcouple.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/repository/Couple/addcouple.dart';
import 'package:wedding_planning_application/repository/Couple/getcouple.dart';

class Coupleservice {
  Addcouplerepo add = Addcouplerepo();
  GetCouplerepo get = GetCouplerepo();
  Future<void> addcouple(String fname, String lname, String email,
      String password, String couple, String user) async {
    add.addcouple(Addcouple(
        firstName: fname,
        lastName: lname,
        email: email,
        password: password,
        couple: couple,
        user: user));
  }

  Future<List<Getcouple>> getcoupleservice() async {
    List<Getcouple> getc = [];
    try {
      getc = await get.getcouple();
    } catch (e) {
      log(e.toString());
    }
    return getc;
  }
}
