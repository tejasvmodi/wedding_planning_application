// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Getbudget {
  int budgetId;
  double expenceAmount; // Update to double
 Map<String, dynamic> serviceCategory;
  String user;
  Getbudget({
    required this.budgetId,
    required this.expenceAmount,
    required this.serviceCategory,
    required this.user,
  });

  Getbudget copyWith({
    int? budgetId,
    double? expenceAmount,
    Map<String, dynamic>? serviceCategory,
    String? user,
  }) {
    return Getbudget(
      budgetId: budgetId ?? this.budgetId,
      expenceAmount: expenceAmount ?? this.expenceAmount,
      serviceCategory: serviceCategory ?? this.serviceCategory,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'budgetId': budgetId,
      'expenceAmount': expenceAmount,
      'serviceCategory': serviceCategory,
      'user': user,
    };
  }

  factory Getbudget.fromMap(Map<String, dynamic> map) {
    return Getbudget(
      budgetId: map['budgetId'] as int,
      expenceAmount: map['expenceAmount'] as double,
      serviceCategory: Map<String, dynamic>.from((map['serviceCategory'] as Map<String, dynamic>)),
      user: map['user'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Getbudget.fromJson(Map<String, dynamic> map){
    
    return Getbudget(
      budgetId: map['budgetId'] as int,
      expenceAmount: map['expenceAmount'] as double,
      serviceCategory: Map<String, dynamic>.from((map['serviceCategory'] as Map<String, dynamic>)),
      user: map['user'] as String,
    );
  
  }

  @override
  String toString() {
    return 'Getbudget(budgetId: $budgetId, expenceAmount: $expenceAmount, serviceCategory: $serviceCategory, user: $user)';
  }

  @override
  bool operator ==(covariant Getbudget other) {
    if (identical(this, other)) return true;
  
    return 
      other.budgetId == budgetId &&
      other.expenceAmount == expenceAmount &&
      mapEquals(other.serviceCategory, serviceCategory) &&
      other.user == user;
  }

  @override
  int get hashCode {
    return budgetId.hashCode ^
      expenceAmount.hashCode ^
      serviceCategory.hashCode ^
      user.hashCode;
  }
}
