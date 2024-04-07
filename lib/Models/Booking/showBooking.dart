  // ignore_for_file: public_member_api_docs, sort_constructors_first
  import 'dart:convert';

  import 'package:flutter/foundation.dart';

  class Showbooking {
    final int serviceItemId;
    final String itemName;
    final double approxPrice;
    final List<String> images;
    Showbooking({
      required this.serviceItemId,
      required this.itemName,
      required this.approxPrice,
      required this.images,
    });

    Showbooking copyWith({
      int? serviceItemId,
      String? itemName,
      double? approxPrice,
      List<String>? images,
    }) {
      return Showbooking(
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

  factory Showbooking.fromMap(Map<String, dynamic> map) {
    return Showbooking(
      serviceItemId: map['serviceItemId'] as int,
      itemName: map['itemName'] as String,
      approxPrice: map['approxPrice'] as double,
      images: List<String>.from(map['images'] as List<dynamic>),
    );
  }


    String toJson() => json.encode(toMap());

    factory Showbooking.fromJson( Map<String, dynamic>  map){
      return Showbooking(
      serviceItemId: map['serviceItemId'] as int,
      itemName: map['itemName'] as String,
      approxPrice: map['approxPrice'] as double,
      images: List<String>.from(map['images'] as List<dynamic>),
    );
    
    }

    @override
    String toString() {
      return 'Showbooking(serviceItemId: $serviceItemId, itemName: $itemName, approxPrice: $approxPrice, images: $images)';
    }

    @override
    bool operator ==(covariant Showbooking other) {
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
