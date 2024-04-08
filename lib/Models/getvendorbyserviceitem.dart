// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetVendorServiceitem {
  int venddorId;
  String businessname;
  String businesscontact;
  String user;
  GetVendorServiceitem({
    required this.venddorId,
    required this.businessname,
    required this.businesscontact,
    required this.user,
  });

  GetVendorServiceitem copyWith({
    int? venddorId,
    String? businessname,
    String? businesscontact,
    String? user,
  }) {
    return GetVendorServiceitem(
      venddorId: venddorId ?? this.venddorId,
      businessname: businessname ?? this.businessname,
      businesscontact: businesscontact ?? this.businesscontact,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'venddorId': venddorId,
      'businessname': businessname,
      'businesscontact': businesscontact,
      'user': user,
    };
  }

  factory GetVendorServiceitem.fromMap(Map<String, dynamic> map) {
    return GetVendorServiceitem(
      venddorId: map['venddorId'] as int,
      businessname: map['businessname'] as String,
      businesscontact: map['businesscontact'] as String,
      user: map['user'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetVendorServiceitem.fromJson(Map<String, dynamic> map){
     return GetVendorServiceitem(
      venddorId: map['venddorId'] as int,
      businessname: map['businessname'] as String,
      businesscontact: map['businesscontact'] as String,
      user: map['user'] as String,
    );
  }

  @override
  String toString() {
    return 'GetVendorServiceitem(venddorId: $venddorId, businessname: $businessname, businesscontact: $businesscontact, user: $user)';
  }

  @override
  bool operator ==(covariant GetVendorServiceitem other) {
    if (identical(this, other)) return true;
  
    return 
      other.venddorId == venddorId &&
      other.businessname == businessname &&
      other.businesscontact == businesscontact &&
      other.user == user;
  }

  @override
  int get hashCode {
    return venddorId.hashCode ^
      businessname.hashCode ^
      businesscontact.hashCode ^
      user.hashCode;
  }
}
