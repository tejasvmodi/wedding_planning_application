// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: file_names
class Getcouple {
 int coupleId;
 String bride;
 String groom;
  Getcouple({
    required this.coupleId,
    required this.bride,
    required this.groom,
  });

  Getcouple copyWith({
    int? coupleId,
    String? bride,
    String? groom,
  }) {
    return Getcouple(
      coupleId: coupleId ?? this.coupleId,
      bride: bride ?? this.bride,
      groom: groom ?? this.groom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coupleId': coupleId,
      'bride': bride,
      'groom': groom,
    };
  }

  factory Getcouple.fromMap(Map<String, dynamic> map) {
    return Getcouple(
      coupleId: map['coupleId'] as int,
      bride: map['bride'] as String,
      groom: map['groom'] as String,
    );
  }

   Map<String, dynamic> tojson() {
    return <String, dynamic>{
      'coupleId': coupleId,
      'bride': bride,
      'groom': groom,
    };
  }

  factory Getcouple.fromJson( Map<String, dynamic> map){
      return Getcouple(
      coupleId: map['coupleId'] as int,
      bride: map['bride'] as String,
      groom: map['groom'] as String,
    );
  }

  @override
  String toString() => 'Getcouple(coupleId: $coupleId, bride: $bride, groom: $groom)';

  @override
  bool operator ==(covariant Getcouple other) {
    if (identical(this, other)) return true;
  
    return 
      other.coupleId == coupleId &&
      other.bride == bride &&
      other.groom == groom;
  }

  @override
  int get hashCode => coupleId.hashCode ^ bride.hashCode ^ groom.hashCode;
}
