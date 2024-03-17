// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class variationoptionmodel {
  int variationOptionId;
  String variationOptionName;
  variationoptionmodel({
    required this.variationOptionId,
    required this.variationOptionName,
  });


  variationoptionmodel copyWith({
    int? variationOptionId,
    String? variationOptionName,
  }) {
    return variationoptionmodel(
      variationOptionId: variationOptionId ?? this.variationOptionId,
      variationOptionName: variationOptionName ?? this.variationOptionName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'variationOptionId': variationOptionId,
      'variationOptionName': variationOptionName,
    };
  }

  factory variationoptionmodel.fromMap(Map<String, dynamic> map) {
    return variationoptionmodel(
      variationOptionId: map['variationOptionId'] as int,
      variationOptionName: map['variationOptionName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory variationoptionmodel.fromJson( Map<String, dynamic> json){
    return variationoptionmodel(
      variationOptionId: json['variationOptionId'] as int,
      variationOptionName: json['variationOptionName'] as String,
    );
  }

  @override
  String toString() => 'variationoptionmodel(variationOptionId: $variationOptionId, variationOptionName: $variationOptionName)';

  @override
  bool operator ==(covariant variationoptionmodel other) {
    if (identical(this, other)) return true;
  
    return 
      other.variationOptionId == variationOptionId &&
      other.variationOptionName == variationOptionName;
  }

  @override
  int get hashCode => variationOptionId.hashCode ^ variationOptionName.hashCode;
}
