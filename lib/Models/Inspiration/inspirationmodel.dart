// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class inspirationModel {
  int inspiration;
  String user;
  String image;
  String description;
  List<String> tags;
  inspirationModel({
    required this.inspiration,
    required this.user,
    required this.image,
    required this.description,
    required this.tags,
  });
 

  inspirationModel copyWith({
    int? inspiration,
    String? user,
    String? image,
    String? description,
    List<String>? tags,
  }) {
    return inspirationModel(
      inspiration: inspiration ?? this.inspiration,
      user: user ?? this.user,
      image: image ?? this.image,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inspiration': inspiration,
      'user': user,
      'image': image,
      'description': description,
      'tags': tags,
    };
  }

  factory inspirationModel.fromMap(Map<String, dynamic> map) {
    return inspirationModel(
      inspiration: map['inspiration'] as int,
      user: map['user'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      tags: List<String>.from((map['tags'] as List<String>),
    ));
  }

  String toJson() => json.encode(toMap());
factory inspirationModel.fromJson(Map<String, dynamic> map){
    return inspirationModel(
      inspiration: map['inspiration'] as int,
      user: map['user'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      tags: (map['tags'] as List<dynamic>).map((tag) => tag.toString()).toList(),
    );
}
  @override
  String toString() {
    return 'inspirationModel(inspiration: $inspiration, user: $user, image: $image, description: $description, tags: $tags)';
  }

  @override
  bool operator ==(covariant inspirationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.inspiration == inspiration &&
      other.user == user &&
      other.image == image &&
      other.description == description &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return inspiration.hashCode ^
      user.hashCode ^
      image.hashCode ^
      description.hashCode ^
      tags.hashCode;
  }
}
