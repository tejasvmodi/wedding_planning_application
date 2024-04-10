// ignore_for_file: public_member_api_docs, sort_constructors_first

class Addcouple {
  String firstName;
  String lastName;
  String email;
  String password;
  String couple;
  String user;
  Addcouple({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.couple,
    required this.user,
  });


  Addcouple copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? couple,
    String? user,
  }) {
    return Addcouple(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      couple: couple ?? this.couple,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'couple': couple,
      'user': user,
    };
  }

  factory Addcouple.fromMap(Map<String, dynamic> map) {
    return Addcouple(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple: map['couple'] as String,
      user: map['user'] as String,
    );
  }

 
  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'couple': couple,
      'user': user,
    };
  }
  factory Addcouple.fromJson(Map<String, dynamic> map){
    return Addcouple(
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      couple: map['couple'] as String,
      user: map['user'] as String,
    );
  }

  @override
  String toString() {
    return 'Addcouple(firstName: $firstName, lastName: $lastName, email: $email, password: $password, couple: $couple, user: $user)';
  }

  @override
  bool operator ==(covariant Addcouple other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.email == email &&
      other.password == password &&
      other.couple == couple &&
      other.user == user;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      couple.hashCode ^
      user.hashCode;
  }
}
