// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegistrationData {
  String firstName;
  String lastName;
  String email;
  String password;
  String couple;
  RegistrationData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.couple,
  });
 

  RegistrationData copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? couple,
  }) {
    return RegistrationData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      couple: couple ?? this.couple,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'couple': couple,
    };
  }

  factory RegistrationData.fromMap(Map<String, dynamic> map) {
    return RegistrationData(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple: map['couple'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationData.fromJson(String source) => RegistrationData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrationData(firstName: $firstName, lastName: $lastName, email: $email, password: $password, couple: $couple)';
  }

  @override
  bool operator ==(covariant RegistrationData other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password &&
      other.couple == couple;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      couple.hashCode;
  }
}
