// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Registrationdata {
  String firstName;
  String lastName;
  String email;
  String password;
  String couple;
  Registrationdata({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.couple,
  });

  Registrationdata copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? couple,
  }) {
    return Registrationdata(
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

  factory Registrationdata.fromMap(Map<String, dynamic> map) {
    return Registrationdata(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple: map['couple'] as String,
    );
  }

 Map<String, dynamic> toJson() {
    return  <String, dynamic> {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'couple': couple,
    };
  }

  factory Registrationdata.fromJson(String source) => Registrationdata.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Registrationdata(firstName: $firstName, lastName: $lastName, email: $email, password: $password, couple: $couple)';
  }

  @override
  bool operator ==(covariant Registrationdata other) {
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
