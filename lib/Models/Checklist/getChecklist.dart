// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Getchecklist {
  int checklistId;
  String listItem;
  String user;
  String status;
  Getchecklist({
    required this.checklistId,
    required this.listItem,
    required this.user,
    required this.status,
  });
  

  Getchecklist copyWith({
    int? checklistId,
    String? listItem,
    String? user,
    String? status,
  }) {
    return Getchecklist(
      checklistId: checklistId ?? this.checklistId,
      listItem: listItem ?? this.listItem,
      user: user ?? this.user,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'checklistId': checklistId,
      'listItem': listItem,
      'user': user,
      'status': status,
    };
  }

  factory Getchecklist.fromMap(Map<String, dynamic> map) {
    return Getchecklist(
      checklistId: map['checklistId'] as int,
      listItem: map['listItem'] as String,
      user: map['user'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Getchecklist.fromJson( Map<String, dynamic> map ){
    return Getchecklist(
      checklistId: map['checklistId'] as int,
      listItem: map['listItem'] as String,
      user: map['user'] as String,
      status: map['status'] as String,
    ); 
  }

  @override
  String toString() {
    return 'Getchecklist(checklistId: $checklistId, listItem: $listItem, user: $user, status: $status)';
  }

  @override
  bool operator ==(covariant Getchecklist other) {
    if (identical(this, other)) return true;
  
    return 
      other.checklistId == checklistId &&
      other.listItem == listItem &&
      other.user == user &&
      other.status == status;
  }

  @override
  int get hashCode {
    return checklistId.hashCode ^
      listItem.hashCode ^
      user.hashCode ^
      status.hashCode;
  }
}
