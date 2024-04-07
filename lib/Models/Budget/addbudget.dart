// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wedding_planning_application/models/service_category.dart';

class BudgetRequest {
  final double expenceAmount;
  final ServiceCategory serviceCategory;
  BudgetRequest({
    required this.expenceAmount,
    required this.serviceCategory,
  });

  BudgetRequest copyWith({
    double? expenceAmount,
    ServiceCategory? serviceCategory,
  }) {
    return BudgetRequest(
      expenceAmount: expenceAmount ?? this.expenceAmount,
      serviceCategory: serviceCategory ?? this.serviceCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'expenceAmount': expenceAmount,
      'serviceCategory': serviceCategory.toMap(),
    };
  }

  factory BudgetRequest.fromMap(Map<String, dynamic> map) {
    return BudgetRequest(
      expenceAmount: map['expenceAmount'] as double,
      serviceCategory: ServiceCategory.fromMap(map['serviceCategory'] as Map<String,dynamic>),
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'expenceAmount': expenceAmount,
      'serviceCategory': serviceCategory.toJson(),
    };
  }

  factory BudgetRequest.fromJson(String source) => BudgetRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BudgetRequest(expenceAmount: $expenceAmount, serviceCategory: $serviceCategory)';

  @override
  bool operator ==(covariant BudgetRequest other) {
    if (identical(this, other)) return true;
  
    return 
      other.expenceAmount == expenceAmount &&
      other.serviceCategory == serviceCategory;
  }

  @override
  int get hashCode => expenceAmount.hashCode ^ serviceCategory.hashCode;
}
