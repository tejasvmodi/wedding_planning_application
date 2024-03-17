import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/models/variation_option.dart';

class VendorData {
  ServiceCategory category;
  List<VariationOption> variationOptions;
  VendorData({
    required this.category,
    required this.variationOptions,
  });

  @override
  String toString() =>
      'VendorData(category: $category, variationOptions: $variationOptions)';

  @override
  bool operator ==(covariant VendorData other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        listEquals(other.variationOptions, variationOptions);
  }

  @override
  int get hashCode => category.hashCode ^ variationOptions.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category.toMap(),
      'variationOptions': variationOptions.map((x) => x.toMap()).toList(),
    };
  }

  factory VendorData.fromMap(Map<String, dynamic> map) {
    return VendorData(
      category:
          ServiceCategory.fromMap(map['category'] as Map<String, dynamic>),
      variationOptions: List<VariationOption>.from(
        (map['variationOptions'] as List<int>).map<VariationOption>(
          (x) => VariationOption.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorData.fromJson(String source) =>
      VendorData.fromMap(json.decode(source) as Map<String, dynamic>);
}
