import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';

class getUserName {
  int userId;
  String firstName;
  String lastName;
  String email;
  String? phone;
  Avatar avatar;
  AddressInfo? addressInfo;

  getUserName({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.avatar,
    this.addressInfo,
  });

  factory getUserName.fromJson(Map<String, dynamic> map) {
    return getUserName(
      userId: map['userId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      avatar: Avatar.fromJson(map['avatar']),
      addressInfo: map['addressInfo'] != null ? AddressInfo.fromJson(map['addressInfo']) : null,
    );
  }

  @override
  String toString() {
    return 'getUserName(userId: $userId, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, avatar: $avatar, addressInfo: $addressInfo)';
  }
}
