// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: file_names
import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

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
    return {
      'coupleId': coupleId,
      'bride': bride,
      'groom': groom,
    };
  }

  factory Getcouple.fromJson(Map<String, dynamic> map){
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
Future<void> saveCouple(Getcouple couple) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String serializedCouple = json.encode(couple.tojson());
  await prefs.setString('couple_data', serializedCouple);
}

Future<Getcouple?> getCouple() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? serializedCouple = prefs.getString('couple_data');
  if (serializedCouple != null) {
    return Getcouple.fromJson(json.decode(serializedCouple));
  } else {
    return null;
  }
}

Future<void> deleteCouple() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('couple_data');
  log('Couple is removed');
}
