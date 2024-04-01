import 'package:wedding_planning_application/models/Booking/addbooking.dart';
import 'package:wedding_planning_application/repository/Booking/addbooking.dart';

class BookinigService{
 
 final AddBookingrepo add = AddBookingrepo();
  Future<void> addBooking(int serviceId,String amounttobepaid,String dateandtime) async{
    add.addbookingrepo(AddBooking(bookingPrice: amounttobepaid, eventDate: dateandtime, bookedService: serviceId.toString()));
  }
}