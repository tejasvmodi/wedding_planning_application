// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, sort_constructors_firs
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Wishlistdata {
  final int id;
  final String description;
 final String name;
  final String image;
  Wishlistdata({
    required this.id,
    required this.description,
    required this.name,
    required this.image,
  });
  

  Wishlistdata copyWith({
    int? id,
    String? description,
    String? name,
    String? image,
  }) {
    return Wishlistdata(
      id: id ?? this.id,
      description: description ?? this.description,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'name': name,
      'image': image,
    };
  }

  factory Wishlistdata.fromMap(Map<String, dynamic> map) {
    return Wishlistdata(
      id: map['id'] as int,
      description: map['description'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'name': name,
      'image': image,
    };
  }

  factory Wishlistdata.fromJson(Map<String, dynamic> map){  return Wishlistdata(
      id: map['id'] as int,
      description: map['description'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );}

  @override
  String toString() {
    return 'Wishlistdata(id: $id, description: $description, name: $name, image: $image)';
  }

  @override
  bool operator ==(covariant Wishlistdata other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.description == description &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      description.hashCode ^
      name.hashCode ^
      image.hashCode;
  }
}

Future<void> saveWishlistdataList(List<Wishlistdata> serviceList) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String> serializedList =
      serviceList.map((service) => json.encode(service.toJson())).toList();
  await prefs.setStringList('service_data_list', serializedList);
}

Future<List<Wishlistdata>> getWishlistdataList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final List<String>? serializedList = prefs.getStringList('service_data_list');
  if (serializedList != null) {
    return serializedList
        .map((serializedService) =>
            Wishlistdata.fromJson(json.decode(serializedService)))
        .toList();
  } else {
    return [];
  }
}

Future<void> deleteWishlistdata(int idToDelete) async {
  List<Wishlistdata> serviceList = await getWishlistdataList();

  serviceList.removeWhere((service) => service.id == idToDelete);

  await saveWishlistdataList(serviceList);
}
