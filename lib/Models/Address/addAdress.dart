// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:wedding_planning_application/models/Address/citymodel.dart';

class AddAdress {
  String addressLine1;
  String addressLine2;
  CityModel cityInfo;
  AddAdress({
    required this.addressLine1,
    required this.addressLine2,
    required this.cityInfo,
  });

  AddAdress copyWith({
    String? addressLine1,
    String? addressLine2,
    CityModel? cityInfo,
  }) {
    return AddAdress(
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      cityInfo: cityInfo ?? this.cityInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cityInfo': cityInfo.toMap(),
    };
  }

  factory AddAdress.fromMap(Map<String, dynamic> map) {
    return AddAdress(
      addressLine1: map['addressLine1'] as String,
      addressLine2: map['addressLine2'] as String,
      cityInfo: CityModel.fromMap(map['cityInfo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'cityInfo': cityInfo.toMap(),
    };
  }

  factory AddAdress.fromJson(String source) =>
      AddAdress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddAdress(addressLine1: $addressLine1, addressLine2: $addressLine2, cityInfo: $cityInfo)';

  @override
  bool operator ==(covariant AddAdress other) {
    if (identical(this, other)) return true;

    return other.addressLine1 == addressLine1 &&
        other.addressLine2 == addressLine2 &&
        other.cityInfo == cityInfo;
  }

  @override
  int get hashCode =>
      addressLine1.hashCode ^ addressLine2.hashCode ^ cityInfo.hashCode;
}
