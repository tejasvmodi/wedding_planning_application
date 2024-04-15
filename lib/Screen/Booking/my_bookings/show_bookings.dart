import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/Screen/checklist/checklistgroomicon.dart';
import 'package:wedding_planning_application/models/Booking/getbooking.dart';
import 'package:wedding_planning_application/models/Booking/showBooking.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/screen/booking/my_bookings/booking_design.dart';
import 'package:wedding_planning_application/services/Booking/BookingService.dart';
import 'package:wedding_planning_application/services/Userid/userid.dart';

class ShowBooking extends StatefulWidget {
  const ShowBooking({
    super.key,
  });

  @override
  State<ShowBooking> createState() => _ShowBookingState();
}

class _ShowBookingState extends State<ShowBooking> {
  List<GetBookings> getbook = [];
  List<GetBookings> getbookig = [];
  BookinigService booking = BookinigService();

  List<Showbooking> serviceItems1 = [];

  List<Showbooking> serviceItems = [];

  String? _selectedGender;
  List<Getcouple> updatedCoupleList = [];
  bool bride = false;
  int userId1 = 0;

  final List<Map<String, dynamic>> bdesignbride = [];
  @override
  void initState() {
    super.initState();
    someFunction();
    getbooking();
    _loadGenderFromPrefs().then((value) {
      if (updatedCoupleList.isNotEmpty) {
        log(updatedCoupleList[0].groom.toString());
        log(userId1.toString());
        if (int.parse(updatedCoupleList[0].groom.toString()) ==
            int.parse(userId1.toString())) {
          getbookingcouple(int.parse(updatedCoupleList[0].bride.toString()));
          log('not come here');
          log(updatedCoupleList[0].bride.toString());
        } else {
          getbookingcouple(int.parse(updatedCoupleList[0].groom.toString()));
          log('direct here ');
          log(updatedCoupleList[0].groom.toString());
        }
      } else {
        log('Wait for the seconds ');
      }
    });
  }

  Future<void> someFunction() async {
    final userId = await getUserId();
    if (userId != null) {
      userId1 = userId;
      // Use the user ID for further processing
      setState(() {
        userId1;
        log(userId1.toString());
      });
    } else {
      log('User ID not found in SharedPreferences');
    }
  }

  Future<void> _loadGenderFromPrefs() async {
    final Getcouple? storedCouple = await getCouple();

    if (storedCouple != null) {
      setState(() {
        updatedCoupleList = [storedCouple];
      });

      if (userId1 != 0 && updatedCoupleList.isNotEmpty) {
        if (int.parse(updatedCoupleList[0].groom.toString()) != userId1) {
          if (int.parse(updatedCoupleList[0].bride.toString()) == userId1) {
            bride = true;
          } else {
            bride = false;
          }
        }
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _selectedGender = (prefs.getString('gender') ?? 'BRIDE');
      log('No couples found in SharedPreferences.');
    }
  }

  Future<void> getbookingcouple(int id) async {
    getbookig = await booking.getbookingcouple(id);
    if (getbookig.isNotEmpty) {
      // Create a list to hold futures for fetching service items
      List<Future<Showbooking>> futures = [];
      for (final booking1 in getbookig) {
        // Use 'final' for loop variable
        futures.add(booking.getserviceitem(int.parse(booking1.bookedService)));
      }
      // Wait for all service item futures to complete
      serviceItems1 = await Future.wait(futures);

      setState(() {
        serviceItems1;
        getbookig;
        log(getbookig.toString());
        log(serviceItems1.toString());
      });
    }
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
              if (updatedCoupleList.isNotEmpty)
                bride
                    ? groomdesign(context, 'icon_bride.png', 'BRIDE')
                    : groomdesign(context, 'icon_groom.png', 'GROOM'),
              if (updatedCoupleList.isNotEmpty)
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),

              //for registration when no couple is created
              if (_selectedGender != null)
                _selectedGender != 'BRIDE'
                    ? groomdesign(context, 'icon_groom.png', 'GROOM')
                    : groomdesign(context, 'icon_bride.png', 'BRIDE'),
              if (_selectedGender != null)
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 2,
                  spacing: 5,
                  children: [
                    if (updatedCoupleList.isNotEmpty)
                      if (getbook.isEmpty && serviceItems.isEmpty)
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
                            int.parse(getbook[i].bookedService),
                            context),
                  ],
                ),
              ),
              if (updatedCoupleList.isNotEmpty)
                bride
                    ? groomdesign(context, 'icon_groom.png', 'GROOM')
                    : groomdesign(context, 'icon_bride.png', 'BRIDE'),

              if (updatedCoupleList.isNotEmpty)
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 2,
                  spacing: 5,
                  children: [
                    if (updatedCoupleList.isNotEmpty)
                      if (getbookig.isEmpty && serviceItems1.isEmpty)
                        const Center(
                          heightFactor: 5,
                          child: CircularProgressIndicator(),
                        ),
                    if (getbookig.isNotEmpty && serviceItems1.isNotEmpty)
                      for (int i = 0; i < getbookig.length; i++)
                        bookingdesign(
                            serviceItems1[i].images[0].toString(),
                            serviceItems1[i].itemName.toString(),
                            serviceItems1[i].approxPrice.toInt(),
                            getbookig[i].eventDate,
                            int.parse(getbookig[i].bookedService),
                            context),
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
