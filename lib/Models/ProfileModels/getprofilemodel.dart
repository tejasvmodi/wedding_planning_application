import 'dart:convert';

class GetprofileModel {
  int userId;
  String firstName;
  String lastName;
  String email;
  String? phone;
  Avatar avatar;
  AddressInfo? addressInfo;

  GetprofileModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatar,
    this.addressInfo,
  });
  factory GetprofileModel.fromJson(Map<String, dynamic> map) {
    return GetprofileModel(
      userId: map['userId'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      avatar: Avatar.fromJson(map['avatar']),
      addressInfo: map['addressInfo'] != null ? AddressInfo.fromJson(map['addressInfo']) : null,
    );
  }


}

class Avatar {
  int imageId;
  String url;

  Avatar({
    required this.imageId,
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      imageId: json['imageId'] as int,
      url: json['url'] as String,
    );
  }
}
class AddressInfo {
  final int addressId;
  final String addressLine1;
  final String addressLine2;
  final CityInfo cityInfo;

  AddressInfo({
    required this.addressId,
    required this.addressLine1,
    required this.addressLine2,
    required this.cityInfo,
  });

  factory AddressInfo.fromJson(Map<String, dynamic> json) {
    return AddressInfo(
      addressId: json['addressId'] as int,
      addressLine1: json['addressLine1'] as String,
      addressLine2: json['addressLine2'] as String,
      cityInfo: CityInfo.fromJson(json['cityInfo']),
    );
  }
}
class CityInfo {
  final int cityId;
  final String cityName;

  CityInfo({
    required this.cityId,
    required this.cityName,
  });

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    return CityInfo(
      cityId: json['cityId'] as int,
      cityName: json['cityName'] as String,
    );
  }
}
