// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetvendorbyServiceItem {
  int vendorid;
  String businessname;
  String businessContact;
  int user;
  GetvendorbyServiceItem({
    required this.vendorid,
    required this.businessname,
    required this.businessContact,
    required this.user,
  });
  

  GetvendorbyServiceItem copyWith({
    int? vendorid,
    String? businessname,
    String? businessContact,
    int? user,
  }) {
    return GetvendorbyServiceItem(
      vendorid: vendorid ?? this.vendorid,
      businessname: businessname ?? this.businessname,
      businessContact: businessContact ?? this.businessContact,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vendorid': vendorid,
      'businessname': businessname,
      'businessContact': businessContact,
      'user': user,
    };
  }

  factory GetvendorbyServiceItem.fromMap(Map<String, dynamic> map) {
    return GetvendorbyServiceItem(
      vendorid: map['vendorid'] as int,
      businessname: map['businessname'] as String,
      businessContact: map['businessContact'] as String,
      user: map['user'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetvendorbyServiceItem.fromJson(String source) => GetvendorbyServiceItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetvendorbyServiceItem(vendorid: $vendorid, businessname: $businessname, businessContact: $businessContact, user: $user)';
  }

  @override
  bool operator ==(covariant GetvendorbyServiceItem other) {
    if (identical(this, other)) return true;
  
    return 
      other.vendorid == vendorid &&
      other.businessname == businessname &&
      other.businessContact == businessContact &&
      other.user == user;
  }

  @override
  int get hashCode {
    return vendorid.hashCode ^
      businessname.hashCode ^
      businessContact.hashCode ^
      user.hashCode;
  }
}
