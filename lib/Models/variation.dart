import 'dart:convert';

class variation {
  int variationId;
  String variationName;
  variation({
    required this.variationId,
    required this.variationName,
  });

  variation copyWith({
    int? variationId,
    String? variationName,
  }) {
    return variation(
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

  factory variation.fromMap(Map<String, dynamic> map) {
    return variation(
      variationId: map['variationId'] as int,
      variationName: map['variationName'] as String,
    );
  }

  factory variation.fromJson(Map<String, dynamic> json) {
  return variation(
    variationId: json['variationId'] as int,
    variationName: json['variationName'] as String,
  );
}


  String toJson() => json.encode(toMap());

  @override
  String toString() => 'variation(variationId: $variationId, variationName: $variationName)';

  @override
  bool operator ==(covariant variation other) {
    if (identical(this, other)) return true;
  
    return 
      other.variationId == variationId &&
      other.variationName == variationName;
  }

  @override
  int get hashCode => variationId.hashCode ^ variationName.hashCode;
}
