// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CityModel {
  int cityId;
  String? cityName;
  CityModel({
    required this.cityId,
    required this.cityName,
  });
  

  CityModel copyWith({
    int? cityId,
    String? cityName,
  }) {
    return CityModel(
      cityId: cityId ?? this.cityId,
      cityName: cityName ?? this.cityName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cityId': cityId,
      'cityName': cityName,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      cityId: map['cityId'] as int,
      cityName: map['cityName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) => CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CityModel(cityId: $cityId, cityName: $cityName)';

  @override
  bool operator ==(covariant CityModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.cityId == cityId &&
      other.cityName == cityName;
  }

  @override
  int get hashCode => cityId.hashCode ^ cityName.hashCode;
}
