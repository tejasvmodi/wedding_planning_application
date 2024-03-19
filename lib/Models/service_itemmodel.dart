// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ServiceitemModel {
  int serviceItemId;
  String itemName;
  double approxPrice;
  List<String> images;
  ServiceitemModel({
    required this.serviceItemId,
    required this.itemName,
    required this.approxPrice,
    required this.images,
  });
  

  ServiceitemModel copyWith({
    int? serviceItemId,
    String? itemName,
    double? approxPrice,
    List<String>? images,
  }) {
    return ServiceitemModel(
      serviceItemId: serviceItemId ?? this.serviceItemId,
      itemName: itemName ?? this.itemName,
      approxPrice: approxPrice ?? this.approxPrice,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceItemId': serviceItemId,
      'itemName': itemName,
      'approxPrice': approxPrice,
      'images': images,
    };
  }

  factory ServiceitemModel.fromMap(Map<String, dynamic> map) {
    return ServiceitemModel(
      serviceItemId: map['serviceItemId'] as int,
      itemName: map['itemName'] as String,
      approxPrice: map['approxPrice'] as double,
      images: List<String>.from((map['images'] as List<String>)));
  }

  String toJson() => json.encode(toMap());

  factory ServiceitemModel.fromJson(Map<String, dynamic> map) {
  return ServiceitemModel(
    serviceItemId: map['serviceItemId'] ,
    itemName: map['itemName'],
    approxPrice: map['approxPrice'],
    images: List<String>.from(map['images']),

  );
}
  @override
  String toString() {
    return 'ServiceitemModel(serviceItemId: $serviceItemId, itemName: $itemName, approxPrice: $approxPrice, images: $images)';
  }

  @override
  bool operator ==(covariant ServiceitemModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.serviceItemId == serviceItemId &&
      other.itemName == itemName &&
      other.approxPrice == approxPrice &&
      listEquals(other.images, images);
  }

  @override
  int get hashCode {
    return serviceItemId.hashCode ^
      itemName.hashCode ^
      approxPrice.hashCode ^
      images.hashCode;
  }
}
