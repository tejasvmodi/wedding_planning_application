import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/Book%20service/Bookin%20service%20component/bookitem.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20single%20view%20Screen/vendorsingleview.dart';

class bookservicew extends StatefulWidget {
  const bookservicew({super.key});

  @override
  State<bookservicew> createState() => _bookservicewState();
}

class _bookservicewState extends State<bookservicew> {
  DateTime selectedDate = DateTime.now();

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
      body: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
            color: Color.fromRGBO(111, 80, 80, 1),
          )),
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 231, 255, 1),
                Color.fromRGBO(255, 219, 249, 1),
              ]),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            bookitem(
                'assets/images/Vender_Venue.jpg',
                'Venue',
                context,
                const vendorsingleview(),
                'ITC Grand',
                'Vendor name',
                121000,
                25000,
                12500),
            SizedBox(
              height: 50,
              width: 360,
              child: TextButton(
                  onPressed: () {},
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
              height: 250,
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
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
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
                              '1,25,000',
                              textAlign: TextAlign.left,
                              style: TextStyle(
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
                  child: TextButton(onPressed: () {}, 
                   style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(77, 43, 43, 1)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55),
                      )
                      ),
                      shadowColor: const MaterialStatePropertyAll(Colors.grey)
                      
                    ),child: const Text('Book Service', textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'EBGaramond',
                          fontSize: 23,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),)),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
