// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Forgotpasswordmodel {
  String username;
  Forgotpasswordmodel({
    required this.username,
  });

  Forgotpasswordmodel copyWith({
    String? username,
  }) {
    return Forgotpasswordmodel(
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
    };
  }

  factory Forgotpasswordmodel.fromMap(Map<String, dynamic> map) {
    return Forgotpasswordmodel(
      username: map['username'] as String,
    );
  }

   Map<String, dynamic> toJson(){
  return {
      'username': username,
    };
  }

  factory Forgotpasswordmodel.fromJson(String source) => Forgotpasswordmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Forgotpasswordmodel(username: $username)';

  @override
  bool operator ==(covariant Forgotpasswordmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username;
  }

  @override
  int get hashCode => username.hashCode;
}
