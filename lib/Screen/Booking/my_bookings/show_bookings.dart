import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/models/Booking/showBooking.dart';
import 'package:wedding_planning_application/screen/booking/my_bookings/booking_design.dart';
import 'package:wedding_planning_application/services/Booking/BookingService.dart';

class ShowBooking extends StatefulWidget {
  const ShowBooking({
    super.key,
  });

  @override
  State<ShowBooking> createState() => _ShowBookingState();
}

class _ShowBookingState extends State<ShowBooking> {
  List<GetBookings> getbook = [];
  BookinigService booking = BookinigService();
  List<Showbooking> c = [];

  List<Showbooking> serviceItems = [];
  final List<Map<String, dynamic>> bdesignbride = [];
  @override
  void initState() {
    super.initState();

    getbooking();
  }

  Future<void> getbooking() async {
    getbook = await booking.getbooking();
    if (getbook.isNotEmpty) {
      // Create a list to hold futures for fetching service items
      List<Future<Showbooking>> futures = [];
      for (final booking1 in getbook) {
        // Use 'final' for loop variable
        futures.add(booking.getserviceitem(int.parse(booking1.bookedService)));
      }
      // Wait for all service item futures to complete
      serviceItems = await Future.wait(futures);

      setState(() {
        serviceItems;
        getbook;
        log(getbook.toString());
        log(serviceItems.toString());
      });
    }
  }

  final List<Map<String, dynamic>> bdesigngroom = [
    {
      'newimage': 'Vendor_carting.jpg',
      'texttitle': 'Mamta Caters',
      'content': 'All food Items serve in Div',
      'money': '120000',
      'booktime': "2023-11-10 00:00:00", // String format
      'eventdates': "2023-12-10 00:00:00", // String format
    },
    {
      'newimage': 'Vendors_Venue_2.jpg',
      'texttitle': 'Smit Halls',
      'content': 'Venue Hall At Palanpur',
      'money': '1500',
      'booktime': "2022-11-25 00:00:00", // String format
      'eventdates': "2022-12-10 00:00:00", // String format
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Bookings',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(85, 32, 32, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black)),
          gradient: LinearGradient(
            begin: Alignment(6.123234262925839e-17, 1),
            end: Alignment(-1, 6.123234262925839e-17),
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 231, 255, 1),
              Color.fromRGBO(255, 219, 249, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/icon_bride.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    'Bride',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(85, 32, 32, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  )
                ],
              ),
              const Divider(color: Colors.black26, indent: 20, endIndent: 20),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 2,
                  spacing: 5,
                  children: [

                    if(getbook.isEmpty && serviceItems.isEmpty)
                    const Center(
                      heightFactor: 5,
                     child: CircularProgressIndicator(),
                    ),
                    if (getbook.isNotEmpty && serviceItems.isNotEmpty)
                      for (int i = 0; i < getbook.length; i++)
                       
                        bookingdesign(
                            serviceItems[i].images[0].toString(),
                            serviceItems[i].itemName.toString(),
                            serviceItems[i].approxPrice.toInt(),
                            getbook[i].eventDate,
                            context),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/icon_groom.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    'Groom',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(85, 32, 32, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  )
                ],
              ),
              const Divider(color: Colors.black26, indent: 20, endIndent: 20),
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: Wrap(
              //     runSpacing: 2,
              //     spacing: 5,
              //     children: [
              //       ...bdesigngroom.map(
              //         (vendor) => bookingdesign(
              //           vendor['newimage']!,
              //           vendor['texttitle']!,
              //           int.parse(vendor['money']!),
              //           vendor['eventdates']!,
              //           context,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
