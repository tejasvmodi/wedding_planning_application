import 'dart:developer';

import 'package:wedding_planning_application/models/Booking/addbooking.dart';
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/models/Booking/showBooking.dart';
import 'package:wedding_planning_application/repository/Booking/addbooking.dart';
import 'package:wedding_planning_application/repository/Booking/getbooking.dart';
import 'package:wedding_planning_application/repository/Booking/showbookingitem.dart';
class BookinigService {
  final AddBookingrepo add = AddBookingrepo();
  final Getbookingrepo get = Getbookingrepo();
  Getservicesinglerepo service = Getservicesinglerepo();
  Future<void> addBooking(
      int serviceId, String amounttobepaid, String dateandtime) async {
    add.addbookingrepo(AddBooking(
        bookingPrice: amounttobepaid,
        eventDate: dateandtime,
        bookedService: serviceId.toString()));
  }

  Future<List<GetBookings>> getbooking() async {
    List<GetBookings> getbooking = [];
    try {
      getbooking = await get.getbookingrepo();
    } catch (e) {
      // log(e.toString());
    }
// log(getbooking.toString());
    return getbooking;
  }

Future<Showbooking> getserviceitem(int serviceitemid) async {
  try {
    Showbooking serviceItem = await service.fetchServiceItem(serviceitemid);
    // log(serviceItem.toString());
    return serviceItem;
  } catch (e) {
    log('Error fetching service item: $e');
    rethrow; // Re-throw the exception to propagate it upwards
  }
}

}
