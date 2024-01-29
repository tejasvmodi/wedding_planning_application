import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';
import 'package:wedding_planning_application/Screen/Booking/Book%20service/Bookin%20service%20component/bookitem.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20single%20view%20Screen/vendorsingleview.dart';


class bookservicew extends StatefulWidget {
  const bookservicew({super.key});

  @override
  State<bookservicew> createState() => _bookservicewState();
}

class _bookservicewState extends State<bookservicew> {
  Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await findSystemLocale();
  }
  

  DateTime? selectedDate;
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
              height: 180,
              width: 340,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(23, 34)),
                  boxShadow: const [
                    BoxShadow(blurRadius: 3, color: Colors.transparent)
                  ]),
              child: Column(children: [
                SizedBox(
                  width: 370,
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 290,
                          height: 60,
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
                          child: DateTimeFormField(
  decoration: const InputDecoration(
    labelText: 'Enter Date',
  ),
  
  firstDate: DateTime.now().add(const Duration(days: 10)),
  lastDate: DateTime.now().add(const Duration(days: 40)),
  initialPickerDateTime: DateTime.now().add(const Duration(days: 20)),
  onChanged: (DateTime? value) {
    selectedDate = value;
  },
),


                              ),
                            
                          
                        ),
                      
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
