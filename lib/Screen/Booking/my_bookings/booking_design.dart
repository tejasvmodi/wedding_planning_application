import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wedding_planning_application/Screen/vendor/vendor_single_view.dart';
Widget bookingdesign(String newimage, String textdata, int money,  String eventdates,int bokedby,BuildContext context) {
  return SizedBox(
    height: 320,
    width: MediaQuery.of(context).size.width / 2 - 12.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 8,bottom: 10),
          height: 170,
          width: 190,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(newimage),
              fit: BoxFit.cover,
            ),
          ),
          child: Text( textdata,style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'EBGaramond',
                      fontSize: 24,
                      letterSpacing: 0,
                      height: 1,
                      overflow: TextOverflow.ellipsis
                    ),),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 190,
          decoration: const BoxDecoration(
            color: Color(0xFFD7BBBB),
            borderRadius: BorderRadius.all(Radius.elliptical(8, 8)),
          ),
          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Booking Details',
                    style: TextStyle(
                      color: Color.fromRGBO(85, 32, 32, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 15,
                      letterSpacing: 0,
                      height: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Booked At : ',
                      style: TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                     Text(
                       NumberFormat.currency(locale: 'en_IN',symbol: '₹').format(money),
                      
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
               
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Event Date :',
                      style: TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                   Text(
                      '${eventdates.split('-')[0]}-${eventdates.split('-')[1]}-${eventdates.split('-')[2]}'  ,
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
         
                ),
                 const SizedBox(
                  height: 5,
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Event Date :',
                      style: TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                   Text(
                      '${eventdates.split('-')[3]}-${eventdates.split('-')[4]}'  ,
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        height: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
          
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.only(top: 0, bottom: 13),
          width: 190,
          height: 40,
          child: TextButton(
            onPressed: () {
              Get.to(()=>VendorSingleView(serviceid: bokedby ));
            },
            style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(
                Color.fromRGBO(96, 67, 67, 1),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            child: const Text(
              'view',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'EBGaramond',
                fontSize: 25,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
