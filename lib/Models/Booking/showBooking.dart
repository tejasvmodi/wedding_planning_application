// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ShowBooking {
  int bookingID;
  String image;
  String bookingPrice;
  String itemName;
  String eventDate;
  String bookedBy;
  ShowBooking({
    required this.bookingID,
    required this.image,
    required this.bookingPrice,
    required this.itemName,
    required this.eventDate,
    required this.bookedBy,
  });

  ShowBooking copyWith({
    int? bookingID,
    String? image,
    String? bookingPrice,
    String? itemName,
    String? eventDate,
    String? bookedBy,
  }) {
    return ShowBooking(
      bookingID: bookingID ?? this.bookingID,
      image: image ?? this.image,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      itemName: itemName ?? this.itemName,
      eventDate: eventDate ?? this.eventDate,
      bookedBy: bookedBy ?? this.bookedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingID': bookingID,
      'image': image,
      'bookingPrice': bookingPrice,
      'itemName': itemName,
      'eventDate': eventDate,
      'bookedBy': bookedBy,
    };
  }

  factory ShowBooking.fromMap(Map<String, dynamic> map) {
    return ShowBooking(
      bookingID: map['bookingID'] as int,
      image: map['image'] as String,
      bookingPrice: map['bookingPrice'] as String,
      itemName: map['itemName'] as String,
      eventDate: map['eventDate'] as String,
      bookedBy: map['bookedBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShowBooking.fromJson(String source) => ShowBooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShowBooking(bookingID: $bookingID, image: $image, bookingPrice: $bookingPrice, itemName: $itemName, eventDate: $eventDate, bookedBy: $bookedBy)';
  }

  @override
  bool operator ==(covariant ShowBooking other) {
    if (identical(this, other)) return true;
  
    return 
      other.bookingID == bookingID &&
      other.image == image &&
      other.bookingPrice == bookingPrice &&
      other.itemName == itemName &&
      other.eventDate == eventDate &&
      other.bookedBy == bookedBy;
  }

  @override
  int get hashCode {
    return bookingID.hashCode ^
      image.hashCode ^
      bookingPrice.hashCode ^
      itemName.hashCode ^
      eventDate.hashCode ^
      bookedBy.hashCode;
  }
}
