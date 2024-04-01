// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Relation {
  int relationshipId;
  String relationshipName;
  Relation({
    required this.relationshipId,
    required this.relationshipName,
  });
  

  Relation copyWith({
    int? relationshipId,
    String? relationshipName,
  }) {
    return Relation(
      relationshipId: relationshipId ?? this.relationshipId,
      relationshipName: relationshipName ?? this.relationshipName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'relationshipId': relationshipId,
      'relationshipName': relationshipName,
    };
  }

  factory Relation.fromMap(Map<String, dynamic> map) {
    return Relation(
      relationshipId: map['relationshipId'] as int,
      relationshipName: map['relationshipName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Relation.fromJson(String source) => Relation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Relation(relationshipId: $relationshipId, relationshipName: $relationshipName)';

  @override
  bool operator ==(covariant Relation other) {
    if (identical(this, other)) return true;
  
    return 
      other.relationshipId == relationshipId &&
      other.relationshipName == relationshipName;
  }

  @override
  int get hashCode => relationshipId.hashCode ^ relationshipName.hashCode;
}
