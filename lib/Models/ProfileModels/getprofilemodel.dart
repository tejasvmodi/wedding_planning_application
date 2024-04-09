import 'dart:convert';

class GetprofileModel {
  int userId;
  String firstName;
  String lastName;
  String email;
  String phone;
  Avatar avatar;
  AddressInfo addressInfo;

  GetprofileModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatar,
    required this.addressInfo,
  });

  factory GetprofileModel.fromJson(Map<String, dynamic> json) {
    return GetprofileModel(
      userId: json['userId'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      avatar: Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      addressInfo: AddressInfo.fromJson(json['addressInfo'] as Map<String, dynamic>),
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
  int addressId;
  String addressLine1;
  String addressLine2;
  CityInfo cityInfo;

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
      cityInfo: CityInfo.fromJson(json['cityInfo'] as Map<String, dynamic>),
    );
  }
}

class CityInfo {
  int cityId;
  String cityName;

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
