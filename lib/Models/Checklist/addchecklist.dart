// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddCheckList {
  String listItem;
  String status;
  AddCheckList({
    required this.listItem,
    required this.status,
  });


  AddCheckList copyWith({
    String? listItem,
    String? status,
  }) {
    return AddCheckList(
      listItem: listItem ?? this.listItem,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listItem': listItem,
      'status': status,
    };
  }

  factory AddCheckList.fromMap(Map<String, dynamic> map) {
    return AddCheckList(
      listItem: map['listItem'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddCheckList.fromJson(String source) => AddCheckList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddCheckList(listItem: $listItem, status: $status)';

  @override
  bool operator ==(covariant AddCheckList other) {
    if (identical(this, other)) return true;
  
    return 
      other.listItem == listItem &&
      other.status == status;
  }

  @override
  int get hashCode => listItem.hashCode ^ status.hashCode;
}
