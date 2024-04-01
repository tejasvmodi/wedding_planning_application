import 'dart:developer';

import 'package:wedding_planning_application/models/Booking/addbooking.dart';
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/repository/Booking/addbooking.dart';
import 'package:wedding_planning_application/repository/Booking/getbooking.dart';

class BookinigService{
 
 final AddBookingrepo add = AddBookingrepo();
 final Getbookingrepo get = Getbookingrepo();
  Future<void> addBooking(int serviceId,String amounttobepaid,String dateandtime) async{
    add.addbookingrepo(AddBooking(bookingPrice: amounttobepaid, eventDate: dateandtime, bookedService: serviceId.toString()));
  }

  Future<List<GetBookings>> getbooking() async {

    List<GetBookings>  getbooking=[];
try{
   getbooking =await get.getbookingrepo();
}catch(e){
  log(e.toString());
}
// log(getbooking.toString());
    return getbooking;
  }
}