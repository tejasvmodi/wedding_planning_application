import 'dart:convert';

class Variation {
  int variationId;
  String variationName;
  Variation({
    required this.variationId,
    required this.variationName,
  });

  Variation copyWith({
    int? variationId,
    String? variationName,
  }) {
    return Variation(
      variationId: variationId ?? this.variationId,
      variationName: variationName ?? this.variationName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'variationId': variationId,
      'variationName': variationName,
    };
  }

  factory Variation.fromMap(Map<String, dynamic> map) {
    return Variation(
      variationId: map['variationId'] as int,
      variationName: map['variationName'] as String,
    );
  }

  factory Variation.fromJson(Map<String, dynamic> json) {
    return Variation(
      variationId: json['variationId'] as int,
      variationName: json['variationName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'variation(variationId: $variationId, variationName: $variationName)';

  @override
  bool operator ==(covariant Variation other) {
    if (identical(this, other)) return true;

    return other.variationId == variationId &&
        other.variationName == variationName;
  }

  @override
  int get hashCode => variationId.hashCode ^ variationName.hashCode;
}
