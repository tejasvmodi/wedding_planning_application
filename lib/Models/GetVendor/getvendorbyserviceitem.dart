// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetVendorServiceitem {
  int venddorId;
  String businessname;
  String businesscontact;
  String? user; // Change type to String?
  GetVendorServiceitem({
    required this.venddorId,
    required this.businessname,
    required this.businesscontact,
    this.user,
  });

  // Rest of the class definition remains the same

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
      venddorId: map['vendorId'] as int,
      businessname: map['businessName'] as String,
      businesscontact: map['businessContact'] as String,
      user: map['user'] as String?, // Assign directly without casting
    );
  }

  String toJson() => json.encode(toMap());

  factory GetVendorServiceitem.fromJson(Map<String, dynamic> map) {
    return GetVendorServiceitem(
      venddorId: map['vendorId'] as int,
      businessname: map['businessName'] as String,
      businesscontact: map['businessContact'] as String,
      // ignore: prefer_null_aware_operators
      user: map['user'] != null
          ? map['user'].toString()
          : null, // Convert to String
    );
  }

  @override
  String toString() {
    return 'GetVendorServiceitem(venddorId: $venddorId, businessname: $businessname, businesscontact: $businesscontact, user: $user)';
  }

  @override
  bool operator ==(covariant GetVendorServiceitem other) {
    if (identical(this, other)) return true;

    return other.venddorId == venddorId &&
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
