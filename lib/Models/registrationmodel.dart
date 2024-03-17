// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class RegistrationModel {
  String firstName;
  String lastname;
  String email;
  String password;
  String couple;
  RegistrationModel({
    required this.firstName,
    required this.lastname,
    required this.email,
    required this.password,
    required this.couple,
  });

  RegistrationModel copyWith({
    String? firstName,
    String? lastname,
    String? email,
    String? password,
    String? couple,
  }) {
    return RegistrationModel(
      firstName: firstName ?? this.firstName,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      couple: couple ?? this.couple,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastname': lastname,
      'email': email,
      'password': password,
      'couple': couple.toString(),
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      firstName: map['firstName'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple:map['couple'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) => RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrationModel(firstName: $firstName, lastname: $lastname, email: $email, password: $password, couple: $couple)';
  }

  @override
  bool operator ==(covariant RegistrationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastname == lastname &&
      other.email == email &&
      other.password == password &&
      other.couple == couple;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastname.hashCode ^
      email.hashCode ^
      password.hashCode ^
      couple.hashCode;
  }
}
