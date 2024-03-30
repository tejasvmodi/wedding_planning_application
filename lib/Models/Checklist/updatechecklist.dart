// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Updaatechecklist {
  String checklistId;
  String status;
  Updaatechecklist({
    required this.checklistId,
    required this.status,
  });
  

  Updaatechecklist copyWith({
    String? checklistId,
    String? status,
  }) {
    return Updaatechecklist(
      checklistId: checklistId ?? this.checklistId,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'checklistId': checklistId,
      'status': status,
    };
  }

  factory Updaatechecklist.fromMap(Map<String, dynamic> map) {
    return Updaatechecklist(
      checklistId: map['checklistId'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Updaatechecklist.fromJson(String source) => Updaatechecklist.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Updaatechecklist(checklistId: $checklistId, status: $status)';

  @override
  bool operator ==(covariant Updaatechecklist other) {
    if (identical(this, other)) return true;
  
    return 
      other.checklistId == checklistId &&
      other.status == status;
  }

  @override
  int get hashCode => checklistId.hashCode ^ status.hashCode;
}
