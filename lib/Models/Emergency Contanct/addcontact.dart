// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Addcontact {
  String contactName;
  List<String> numbers;
  String status;
  Addcontact({
    required this.contactName,
    required this.numbers,
    required this.status,
  });


  Addcontact copyWith({
    String? contactName,
    List<String>? numbers,
    String? status,
  }) {
    return Addcontact(
      contactName: contactName ?? this.contactName,
      numbers: numbers ?? this.numbers,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactName': contactName,
      'numbers': numbers,
      'status': status,
    };
  }

  factory Addcontact.fromMap(Map<String, dynamic> map) {
    return Addcontact(
      contactName: map['contactName'] as String,
      numbers: List<String>.from((map['numbers'] as List<String>)),
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Addcontact.fromJson( Map<String, dynamic> map){
 return Addcontact(
      contactName: map['contactName'] as String,
      numbers: List<String>.from((map['numbers'] as List<String>)),
      status: map['status'] as String,
    );
  }

  @override
  String toString() => 'Addcontact(contactName: $contactName, numbers: $numbers, status: $status)';

  @override
  bool operator ==(covariant Addcontact other) {
    if (identical(this, other)) return true;
  
    return 
      other.contactName == contactName &&
      listEquals(other.numbers, numbers) &&
      other.status == status;
  }

  @override
  int get hashCode => contactName.hashCode ^ numbers.hashCode ^ status.hashCode;
}
