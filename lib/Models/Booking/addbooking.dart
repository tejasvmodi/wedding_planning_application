// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddBooking {
  String bookingPrice;
  String eventDate;
  String bookedService;
  AddBooking({
    required this.bookingPrice,
    required this.eventDate,
    required this.bookedService,
  });
  

  AddBooking copyWith({
    String? bookingPrice,
    String? eventDate,
    String? bookedService,
  }) {
    return AddBooking(
      bookingPrice: bookingPrice ?? this.bookingPrice,
      eventDate: eventDate ?? this.eventDate,
      bookedService: bookedService ?? this.bookedService,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookingPrice': bookingPrice,
      'eventDate': eventDate,
      'bookedService': bookedService,
    };
  }

  factory AddBooking.fromMap(Map<String, dynamic> map) {
    return AddBooking(
      bookingPrice: map['bookingPrice'] as String,
      eventDate: map['eventDate'] as String,
      bookedService: map['bookedService'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddBooking.fromJson(String source) => AddBooking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddBooking(bookingPrice: $bookingPrice, eventDate: $eventDate, bookedService: $bookedService)';

  @override
  bool operator ==(covariant AddBooking other) {
    if (identical(this, other)) return true;
  
    return 
      other.bookingPrice == bookingPrice &&
      other.eventDate == eventDate &&
      other.bookedService == bookedService;
  }

  @override
  int get hashCode => bookingPrice.hashCode ^ eventDate.hashCode ^ bookedService.hashCode;
}
