// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class getUserName {
 int userId;
  String firstName;
  String? lastName; // Nullable
  String email;
  String? phone; // Nullable
  String avatar;
  List<dynamic>? addressInfo; // Nullable
  getUserName({
    required this.userId,
    required this.firstName,
    this.lastName,
    required this.email,
    this.phone,
    required this.avatar,
    this.addressInfo,
  });


  getUserName copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? avatar,
    List<dynamic>? addressInfo,
  }) {
    return getUserName(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      addressInfo: addressInfo ?? this.addressInfo,
    );
  }

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
 factory getUserName.fromMap(Map<String, dynamic> map) {
    return getUserName(
      userId: map['userId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String?, // Nullable
      email: map['email'] as String,
      phone: map['phone'] as String?, // Nullable
      avatar: (map['avatar'] as Map<String, dynamic>)['url'] as String,
      addressInfo: map['addressInfo'] != null ? List<dynamic>.from(map['addressInfo']!) : null, // Nullable
    );
  }

  String toJson() => json.encode(toMap());

  factory getUserName.fromJson(String source) => getUserName.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'getUserName(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: $avatar, addressInfo: $addressInfo)';
  }

  @override
  bool operator ==(covariant getUserName other) {
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
