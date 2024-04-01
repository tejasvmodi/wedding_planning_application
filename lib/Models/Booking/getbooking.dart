// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetBookings {
  int bookingId;
  int bookingPrice;
  String eventDate;
  String bookedService;
  String bookedBy;
  GetBookings({
    required this.bookingId,
    required this.bookingPrice,
    required this.eventDate,
    required this.bookedService,
    required this.bookedBy,
  });
  

  GetBookings copyWith({
    int? bookingId,
    int? bookingPrice,
    String? eventDate,
    String? bookedService,
    String? bookedBy,
  }) {
    return GetBookings(
      bookingId: bookingId ?? this.bookingId,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      eventDate: eventDate ?? this.eventDate,
      bookedService: bookedService ?? this.bookedService,
      bookedBy: bookedBy ?? this.bookedBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingId': bookingId,
      'bookingPrice': bookingPrice,
      'eventDate': eventDate,
      'bookedService': bookedService,
      'bookedBy': bookedBy,
    };
  }

  factory GetBookings.fromMap(Map<String, dynamic> map) {
    return GetBookings(
      bookingId: map['bookingId'] as int,
      bookingPrice: map['bookingPrice'] as int,
      eventDate: map['eventDate'] as String,
      bookedService: map['bookedService'] as String,
      bookedBy: map['bookedBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBookings.fromJson(String source) => GetBookings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetBookings(bookingId: $bookingId, bookingPrice: $bookingPrice, eventDate: $eventDate, bookedService: $bookedService, bookedBy: $bookedBy)';
  }

  @override
  bool operator ==(covariant GetBookings other) {
    if (identical(this, other)) return true;
  
    return 
      other.bookingId == bookingId &&
      other.bookingPrice == bookingPrice &&
      other.eventDate == eventDate &&
      other.bookedService == bookedService &&
      other.bookedBy == bookedBy;
  }

  @override
  int get hashCode {
    return bookingId.hashCode ^
      bookingPrice.hashCode ^
      eventDate.hashCode ^
      bookedService.hashCode ^
      bookedBy.hashCode;
  }
}
