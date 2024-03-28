import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

class updateinspiratiojn {
  int inspirationId;
  String description;
  List<String> tags;
  File filename;
  
  updateinspiratiojn({
    required this.inspirationId,
    required this.description,
    required this.tags,
    required this.filename,
  });

  updateinspiratiojn copyWith({
    int? inspirationId,
    String? description,
    List<String>? tags,
    File? filename,
  }) {
    return updateinspiratiojn(
      inspirationId: inspirationId ?? this.inspirationId,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      filename: filename ?? this.filename,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inspirationId': inspirationId,
      'description': description,
      'tags': tags,
      // Convert filename to a path string
      'filename': filename.path,
    };
  }

  factory updateinspiratiojn.fromMap(Map<String, dynamic> map) {
    return updateinspiratiojn(
      inspirationId: map['inspirationId'] as int,
      description: map['description'] as String,
      tags: List<String>.from(map['tags'] as List<dynamic>),
      // Create a new File object from the filename path
      filename: File(map['filename'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory updateinspiratiojn.fromJson(String source) =>
      updateinspiratiojn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'updateinspiratiojn(inspirationId: $inspirationId, description: $description, tags: $tags, filename: $filename)';
  }

  @override
  bool operator ==(covariant updateinspiratiojn other) {
    if (identical(this, other)) return true;

    return other.inspirationId == inspirationId &&
        other.description == description &&
        listEquals(other.tags, tags) &&
        other.filename == filename;
  }

  @override
  int get hashCode {
    return inspirationId.hashCode ^
        description.hashCode ^
        tags.hashCode ^
        filename.hashCode;
  }
}
