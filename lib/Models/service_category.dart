// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class service_Category {
  int serviceCategoryId;
  String serviceCategoryName;
  String icon;
  service_Category({
    required this.serviceCategoryId,
    required this.serviceCategoryName,
    required this.icon,
  });

  service_Category copyWith({
    int? serviceCategoryId,
    String? serviceCategoryName,
    String? icon,
  }) {
    return service_Category(
      serviceCategoryId: serviceCategoryId ?? this.serviceCategoryId,
      serviceCategoryName: serviceCategoryName ?? this.serviceCategoryName,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'serviceCategoryId': serviceCategoryId,
      'serviceCategoryName': serviceCategoryName,
      'icon': icon,
    };
  }

  factory service_Category.fromMap(Map<String, dynamic> map) {
    return service_Category(
      serviceCategoryId: map['serviceCategoryId'] as int,
      serviceCategoryName: map['serviceCategoryName'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory service_Category.fromJson(Map<String, dynamic> json) {
    return service_Category(
      serviceCategoryId: json['serviceCategoryId'] as int,
      serviceCategoryName: json['serviceCategoryName'] as String,
      icon: json['icon'] as String,
    );
  }

  @override
  String toString() =>
      'service_Category(serviceCategoryId: $serviceCategoryId, serviceCategoryName: $serviceCategoryName, icon: $icon)';

  @override
  bool operator ==(covariant service_Category other) {
    if (identical(this, other)) return true;

    return other.serviceCategoryId == serviceCategoryId &&
        other.serviceCategoryName == serviceCategoryName &&
        other.icon == icon;
  }

  @override
  int get hashCode =>
      serviceCategoryId.hashCode ^ serviceCategoryName.hashCode ^ icon.hashCode;
}
