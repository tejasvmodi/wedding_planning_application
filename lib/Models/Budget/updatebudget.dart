

import 'package:wedding_planning_application/models/service_category.dart';

class Updatebudget {
 final  int budgetId;
  final double expenceAmount;
   final ServiceCategory serviceCategory;
  Updatebudget({
    required this.budgetId,
    required this.expenceAmount,
    required this.serviceCategory,
  });

  Updatebudget copyWith({
    int? budgetId,
    double? expenceAmount,
    ServiceCategory? serviceCategory,
  }) {
    return Updatebudget(
      budgetId: budgetId ?? this.budgetId,
      expenceAmount: expenceAmount ?? this.expenceAmount,
      serviceCategory: serviceCategory ?? this.serviceCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'budgetId': budgetId,
      'expenceAmount': expenceAmount,
      'serviceCategory': serviceCategory.toMap(),
    };
  }

  factory Updatebudget.fromMap(Map<String, dynamic> map) {
    return Updatebudget(
      budgetId: map['budgetId'] as int,
      expenceAmount: map['expenceAmount'] as double,
      serviceCategory: ServiceCategory.fromMap(map['serviceCategory'] as Map<String,dynamic>),
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'budgetId': budgetId,
      'expenceAmount': expenceAmount,
      'serviceCategory': serviceCategory.toMap(),
    };
  }

  factory Updatebudget.fromJson( Map<String, dynamic> map){
     return Updatebudget(
      budgetId: map['budgetId'] as int,
      expenceAmount: map['expenceAmount'] as double,
      serviceCategory: ServiceCategory.fromMap(map['serviceCategory'] as Map<String,dynamic>),
    );
  }

  @override
  String toString() => 'Updatebudget(budgetId: $budgetId, expenceAmount: $expenceAmount, serviceCategory: $serviceCategory)';

  @override
  bool operator ==(covariant Updatebudget other) {
    if (identical(this, other)) return true;
  
    return 
      other.budgetId == budgetId &&
      other.expenceAmount == expenceAmount &&
      other.serviceCategory == serviceCategory;
  }

  @override
  int get hashCode => budgetId.hashCode ^ expenceAmount.hashCode ^ serviceCategory.hashCode;
}
