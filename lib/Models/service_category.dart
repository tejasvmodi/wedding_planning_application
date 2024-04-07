// ignore_for_file: public_member_api_docs, sort_constructors_first

class ServiceCategory {
  int serviceCategoryId;
  String? serviceCategoryName;
  String? icon;
  ServiceCategory({
    required this.serviceCategoryId,
     this.serviceCategoryName,
     this.icon,
  });

  ServiceCategory copyWith({
    int? serviceCategoryId,
    String? serviceCategoryName,
    String? icon,
  }) {
    return ServiceCategory(
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

  factory ServiceCategory.fromMap(Map<String, dynamic> map) {
    return ServiceCategory(
      serviceCategoryId: map['serviceCategoryId'] as int,
      serviceCategoryName: map['serviceCategoryName'] as String,
      icon: map['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceCategoryId': serviceCategoryId,
      'serviceCategoryName': serviceCategoryName,
      'icon': icon,
    };
  }

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      serviceCategoryId: json['serviceCategoryId'] as int,
      serviceCategoryName: json['serviceCategoryName'] as String,
      icon: json['icon'] as String,
    );
  }

  @override
  String toString() =>
      'service_Category(serviceCategoryId: $serviceCategoryId, serviceCategoryName: $serviceCategoryName, icon: $icon)';

  @override
  bool operator ==(covariant ServiceCategory other) {
    if (identical(this, other)) return true;

    return other.serviceCategoryId == serviceCategoryId &&
        other.serviceCategoryName == serviceCategoryName &&
        other.icon == icon;
  }

  @override
  int get hashCode =>
      serviceCategoryId.hashCode ^ serviceCategoryName.hashCode ^ icon.hashCode;
}
