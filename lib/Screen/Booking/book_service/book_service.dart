import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/booking/my_bookings/show_bookings.dart';
import 'package:wedding_planning_application/screen/chats/chat_inbox.dart';
// import 'package:wedding_planning_application/screen/other_screens/budget.dart';
import 'package:wedding_planning_application/services/Booking/BookingService.dart';

// ignore: camel_case_types
class bookservicew extends StatefulWidget {
  const bookservicew(
      {super.key,
      required this.servicebookingId,
      required this.approxprice,
      required this.servicename,
      required this.image});
  final int servicebookingId;
  final int approxprice;
  final String servicename;
  final String image;

  @override
  State<bookservicew> createState() => _bookservicewState();
}

// ignore: camel_case_types
class _bookservicewState extends State<bookservicew> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
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
            'Booking',
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
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black)),
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 240, 255, 1),
                  Color.fromRGBO(255, 231, 255, 1),
                  Color.fromRGBO(255, 219, 249, 1),
                ]),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 100,
                width: 340,
                decoration: BoxDecoration(
                color: const Color.fromRGBO(221, 189, 190, 1),
                    border: Border.all(color: Colors.black45),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(23, 23))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Container(
                      height: 80,
                      width: 119,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, 
                        border: Border.all(color: Colors.black45),                       
                        image: DecorationImage(image: NetworkImage(widget.image), )
                      ),
                     ),
                     Expanded(
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Item Name :  ${widget.servicename}',
                             style: const TextStyle(
                            color: Color.fromRGBO(77, 43, 43, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            ),),
                          Text(
                            'Approx Price: Rs. ${widget.approxprice}',
                             style: const TextStyle(
                            color: Color.fromRGBO(77, 43, 43, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w400,
                            height: 1),),
                        ],
                       ),
                     )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
                width: 360,
                child: TextButton(
                    onPressed: () {
                      Get.to(() => const ChatInboxW());
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(77, 43, 43, 1)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      )),
                    ),
                    child: const Text(
                      'Talk to vendor about price ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'EBGaramond',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/icon_booking.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 310,
                width: 360,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(23, 34)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, color: Colors.transparent)
                    ]),
                child: Column(children: [
                  SizedBox(
                    width: 380,
                    height: 80,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 20,
                          right: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(23, 23)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 1),
                                  blurRadius: 4,
                                )
                              ],
                              color: Color.fromRGBO(245, 201, 238, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Date of Event        ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(85, 32, 32, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                Text(
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  style: const TextStyle(
                                      color: Color.fromRGBO(85, 32, 32, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 17,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: Icon(
                                      MdiIcons.calendarTodayOutline,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    height: 80,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 20,
                          left: 20,
                          right: 20,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(23, 23)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 1),
                                  blurRadius: 4,
                                )
                              ],
                              color: Color.fromRGBO(245, 201, 238, 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Time of Event         ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(85, 32, 32, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                Text(
                                  "${selectedTime.hour}-${selectedTime.minute}",
                                  style: const TextStyle(
                                      color: Color.fromRGBO(85, 32, 32, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 17,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final TimeOfDay? timeOfDay =
                                          await showTimePicker(
                                              context: context,
                                              initialTime: selectedTime,
                                              initialEntryMode:
                                                  TimePickerEntryMode.dial);
                                      if (timeOfDay != null) {
                                        setState(() {
                                          selectedTime = timeOfDay;
                                        });
                                      }
                                    },
                                    child: Icon(
                                      MdiIcons.clock,
                                      size: 30,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    width: 380,
                    child: Stack(children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        right: 20,
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.only(left: 5, right: 15),
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(23, 23)),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                                offset: Offset(0, 1),
                                blurRadius: 4,
                              )
                            ],
                            color: Color.fromRGBO(245, 201, 238, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                '  Amount To Be Paid ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(85, 32, 32, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                              Text(
                                widget.approxprice.toString(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color: Color.fromRGBO(85, 32, 32, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 50,
                    width: 320,
                    child: TextButton(
                        onPressed: () {
                          String date = DateFormat('yyyy-MM-dd')
                              .format(selectedDate.toLocal());

                          String datandtime =
                              '$date-${selectedTime.hour.toString()}-${selectedTime.minute.toString()}';
                          
                          BookinigService book = BookinigService();
                          book.addBooking(widget.servicebookingId, widget.approxprice.toString(), datandtime).then((value) {
                          setState(() {
                            Get.to(()=>const ShowBooking());
                          });
                          },);
                          
                            
                        },
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(77, 43, 43, 1)),
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            )),
                            shadowColor:
                                const MaterialStatePropertyAll(Colors.grey)),
                        child: const Text(
                          'Book Service',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'EBGaramond',
                              fontSize: 23,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1),
                        )),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
