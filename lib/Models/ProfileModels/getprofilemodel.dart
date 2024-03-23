import 'dart:convert';

import 'package:flutter/foundation.dart';

class GetprofileModel {
  int userId;
  String firstName;
  String? lastName; // Nullable
  String email;
  String? phone; // Nullable
  String avatar;
  List<dynamic>? addressInfo; // Nullable

  GetprofileModel({
    required this.userId,
    required this.firstName,
    this.lastName, // Nullable
    required this.email,
    this.phone, // Nullable
    required this.avatar,
    this.addressInfo, // Nullable
  });

  factory GetprofileModel.fromMap(Map<String, dynamic> map) {
    return GetprofileModel(
      userId: map['userId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String?, // Nullable
      email: map['email'] as String,
      phone: map['phone'] as String?, // Nullable
      avatar: (map['avatar'] as Map<String, dynamic>)['url'] as String,
      addressInfo: map['addressInfo'] != null ? List<dynamic>.from(map['addressInfo']!) : null, // Nullable
    );
  }

  factory GetprofileModel.fromJson(String source) => GetprofileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'addressInfo': addressInfo,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'GetprofileModel(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: $avatar, addressInfo: $addressInfo)';
  }

  @override
  bool operator ==(covariant GetprofileModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phone == phone &&
      other.avatar == avatar &&
      listEquals(other.addressInfo, addressInfo);
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      avatar.hashCode ^
      addressInfo.hashCode;
  }
}
