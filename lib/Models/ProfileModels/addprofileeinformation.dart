// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Addprofile {
  int userId;
  String firstName;
  String lastName;
  String email;
  String phone;
  Addprofile({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  Addprofile copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    return Addprofile(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }

  factory Addprofile.fromMap(Map<String, dynamic> map) {
    return Addprofile(
      userId: map['userId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
    };
  }

  factory Addprofile.fromJson(String source) => Addprofile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Addprofile(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(covariant Addprofile other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.phone == phone;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      phone.hashCode;
  }
}
