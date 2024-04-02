// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateContact {
  int contactId;
  String contactName;
  String contactEmail;
  UpdateContact({
    required this.contactId,
    required this.contactName,
    required this.contactEmail,
  });


  UpdateContact copyWith({
    int? contactId,
    String? contactName,
    String? contactEmail,
  }) {
    return UpdateContact(
      contactId: contactId ?? this.contactId,
      contactName: contactName ?? this.contactName,
      contactEmail: contactEmail ?? this.contactEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactId': contactId,
      'contactName': contactName,
      'contactEmail': contactEmail,
    };
  }

  factory UpdateContact.fromMap(Map<String, dynamic> map) {
    return UpdateContact(
      contactId: map['contactId'] as int,
      contactName: map['contactName'] as String,
      contactEmail: map['contactEmail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateContact.fromJson(String source) => UpdateContact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UpdateContact(contactId: $contactId, contactName: $contactName, contactEmail: $contactEmail)';

  @override
  bool operator ==(covariant UpdateContact other) {
    if (identical(this, other)) return true;
  
    return 
      other.contactId == contactId &&
      other.contactName == contactName &&
      other.contactEmail == contactEmail;
  }

  @override
  int get hashCode => contactId.hashCode ^ contactName.hashCode ^ contactEmail.hashCode;
}
