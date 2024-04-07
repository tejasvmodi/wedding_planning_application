import 'dart:developer';

import 'package:wedding_planning_application/models/Budget/addbudget.dart';
import 'package:wedding_planning_application/models/Budget/getbudget.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/repository/Budget/addbudgetrepo.dart';
import 'package:wedding_planning_application/repository/Budget/getbudgetrepo.dart';

class BudgetService {
  Addbudgetrepo addRepo = Addbudgetrepo();
  Getbudgetrepo get = Getbudgetrepo();
  
  
  Future<void> addbudget(double price, int id) async {
    BudgetRequest budgetRequest = BudgetRequest(
      expenceAmount: price,
      serviceCategory: ServiceCategory(
          serviceCategoryId: int.parse(id.toString()),
          serviceCategoryName: null,
          icon: null),
    );

    await addRepo.addbudgetrepo(budgetRequest);
  }


 Future<List<Getbudget>> getbudget() async{
  List<Getbudget> getbudget = [];
  try{
    getbudget = await get.getbudgetrepo();
  }catch(e){
    log(e.toString());
  }
  return getbudget;

 }
}
