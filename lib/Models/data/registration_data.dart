import 'dart:convert';

class RegistrationData {
  String firstName;
  String lastname;
  String email;
  String password;
  String couple;
  RegistrationData({
    required this.firstName,
    required this.lastname,
    required this.email,
    required this.password,
    required this.couple,
  });

  RegistrationData copyWith({
    String? firstName,
    String? lastname,
    String? email,
    String? password,
    String? couple,
  }) {
    return RegistrationData(
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

  factory RegistrationData.fromMap(Map<String, dynamic> map) {
    return RegistrationData(
      firstName: map['firstName'] as String,
      lastname: map['lastname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple: map['couple'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationData.fromJson(String source) =>
      RegistrationData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RegistrationModel(firstName: $firstName, lastname: $lastname, email: $email, password: $password, couple: $couple)';
  }

  @override
  bool operator ==(covariant RegistrationData other) {
    if (identical(this, other)) return true;

    return other.firstName == firstName &&
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
