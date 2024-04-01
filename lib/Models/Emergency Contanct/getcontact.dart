import 'dart:convert';

import 'package:flutter/foundation.dart';

class Getcontact {
  int contactId;
  String contactName;
  List<String> numbers;
  String status;
  int user;

  Getcontact({
    required this.contactId,
    required this.contactName,
    required this.numbers,
    required this.status,
    required this.user,
  });

  factory Getcontact.fromMap(Map<String, dynamic> map) {
    return Getcontact(
      contactId: map['contactId'] as int,
      contactName: map['contactName'] as String,
      numbers: List<String>.from(map['numbers'] as List<String>)
          .map((dynamic number) => number.toString())
          .toList(),
      status: map['status'] as String,
      user: map['user'] as int,
    );
  }

  factory Getcontact.fromJson(Map<String, dynamic> map) {
    return Getcontact(
      contactId: map['contactId'] as int,
      contactName: map['contactName'] as String,
      numbers: List<String>.from(map['numbers'] as List<String>)
          .map((dynamic number) => number.toString())
          .toList(),
      status: map['status'] as String,
      user: map['user'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactId': contactId,
      'contactName': contactName,
      'numbers': numbers,
      'status': status,
      'user': user,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Getcontact(contactId: $contactId, contactName: $contactName, numbers: $numbers, status: $status, user: $user)';
  }

  @override
  bool operator ==(covariant Getcontact other) {
    if (identical(this, other)) return true;
  
    return 
      other.contactId == contactId &&
      other.contactName == contactName &&
      listEquals(other.numbers, numbers) &&
      other.status == status &&
      other.user == user;
  }

  @override
  int get hashCode {
    return contactId.hashCode ^
      contactName.hashCode ^
      numbers.hashCode ^
      status.hashCode ^
      user.hashCode;
  }
}
