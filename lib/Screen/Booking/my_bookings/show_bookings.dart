import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/models/service_itemmodel.dart';
import 'package:wedding_planning_application/screen/booking/my_bookings/booking_design.dart';
import 'package:wedding_planning_application/services/Booking/BookingService.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';

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
  VendorService vendor = VendorService();
  List<ServiceitemModel> service = [];

  
  final List<Map<String, dynamic>> combinedList = [];
  @override
  void initState() {
    super.initState();
    getbooking().then((value) => {
          Future.delayed(const Duration(seconds: 5), () {
            // servicedata();
            setState(() {
              log(combinedList.toString());
            });
          })
        });
  }

  Future<void> getbooking() async {
    getbook = await booking.getbooking();
    service = await vendor.getserviceitemdefault();

    setState(() {
      getbook;
      service;

      log(service.toString());
      log(getbook.toString());
    });
  }

  // void servicedata() {
  //   if (getbook.isNotEmpty && service.isNotEmpty) { 
  //     for (int i = 0; i < getbook.length; i++) {
  //       for (int j = 0; j < service.length; j++) {
  //         // log(getbook[i].bookedService.toString());
  //         // log(service[j].serviceItemId.toString());

  //         if (getbook[i].bookedService == service[j].serviceItemId) {
  //           combinedList.add({
  //             "serviceItemId": service[j].serviceItemId,
  //             "itemName": service[j].itemName,
  //             "approxPrice": service[j].approxPrice,
  //             "bookedBy": getbook[i].bookedBy,
  //             "eventDate": getbook[i].eventDate,
  //             // "bookedTime": getbook[i].bookedTime,
  //           });

  //           break;
  //         }
  //         log(combinedList.toString());
  //       }
  //     }
  //   }
  // }

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
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
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
              // Padding(
              //   padding: const EdgeInsets.all(8),
              //   child: Wrap(
              //     runSpacing: 2,
              //     spacing: 5,
              //     children: [
              //       ...bdesign.map(
              //         (vendor) => bookingdesign(
              //           vendor['newimage']!,
              //           vendor['texttitle']!,
              //           vendor['content']!,
              //           int.parse(vendor['money']!),
              //           DateTime.parse(
              //               vendor['booktime']!), // Parse string to DateTime
              //           DateTime.parse(vendor['eventdates']!),
              //           context,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 2,
                  spacing: 5,
                  children: [
                    ...bdesigngroom.map(
                      (vendor) => bookingdesign(
                        vendor['newimage']!,
                        vendor['texttitle']!,
                        vendor['content']!,
                        int.parse(vendor['money']!),
                        DateTime.parse(
                            vendor['booktime']!), // Parse string to DateTime
                        DateTime.parse(vendor['eventdates']!),
                        context,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
