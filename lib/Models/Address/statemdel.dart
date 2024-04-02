// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StateModel {
 int stateId;
 String stateName;
  StateModel({
    required this.stateId,
    required this.stateName,
  });

  StateModel copyWith({
    int? stateId,
    String? stateName,
  }) {
    return StateModel(
      stateId: stateId ?? this.stateId,
      stateName: stateName ?? this.stateName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'stateId': stateId,
      'stateName': stateName,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return StateModel(
      stateId: map['stateId'] as int,
      stateName: map['stateName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) => StateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'StateModel(stateId: $stateId, stateName: $stateName)';

  @override
  bool operator ==(covariant StateModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.stateId == stateId &&
      other.stateName == stateName;
  }

  @override
  int get hashCode => stateId.hashCode ^ stateName.hashCode;
}
