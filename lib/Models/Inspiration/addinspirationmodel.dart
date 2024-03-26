// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Addinspirationmodel {
  File file;
  String description;
  List<String> tags;
  
  Addinspirationmodel({
    required this.file,
    required this.description,
    required this.tags,
  });

  Addinspirationmodel copyWith({
    File? file,
    String? description,
    List<String>? tags,
  }) {
    return Addinspirationmodel(
      file: file ?? this.file,
      description: description ?? this.description,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'file': file.path,
      'description': description,
      'tags': tags,
    };
  }

  factory Addinspirationmodel.fromMap(Map<String, dynamic> map) {
    return Addinspirationmodel(
      file: File(map['file'] as String),
      description: map['description'] as String,
      tags: List<String>.from(map['tags'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Addinspirationmodel.fromJson(String source) => Addinspirationmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Addinspirationmodel(file: $file, description: $description, tags: $tags)';

  @override
  bool operator ==(covariant Addinspirationmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.file == file &&
      other.description == description &&
      listEquals(other.tags, tags);
  }

  @override
  int get hashCode => file.hashCode ^ description.hashCode ^ tags.hashCode;
}
