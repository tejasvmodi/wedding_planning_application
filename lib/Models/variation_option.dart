// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VariationOption {
  int variationOptionId;
  String variationOptionName;
  VariationOption({
    required this.variationOptionId,
    required this.variationOptionName,
  });

  VariationOption copyWith({
    int? variationOptionId,
    String? variationOptionName,
  }) {
    return VariationOption(
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

  factory VariationOption.fromMap(Map<String, dynamic> map) {
    return VariationOption(
      variationOptionId: map['variationOptionId'] as int,
      variationOptionName: map['variationOptionName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VariationOption.fromJson(Map<String, dynamic> json) {
    return VariationOption(
      variationOptionId: json['variationOptionId'] as int,
      variationOptionName: json['variationOptionName'] as String,
    );
  }

  @override
  String toString() =>
      'variationoptionmodel(variationOptionId: $variationOptionId, variationOptionName: $variationOptionName)';

  @override
  bool operator ==(covariant VariationOption other) {
    if (identical(this, other)) return true;

    return other.variationOptionId == variationOptionId &&
        other.variationOptionName == variationOptionName;
  }

  @override
  int get hashCode => variationOptionId.hashCode ^ variationOptionName.hashCode;
}
