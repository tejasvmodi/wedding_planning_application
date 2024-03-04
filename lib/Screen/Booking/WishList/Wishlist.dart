import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/WishList%20component/wishlistdesign.dart';

class WishListW extends StatefulWidget {
  const WishListW({super.key});

  @override
  State<WishListW> createState() => _WishListWState();
}

class _WishListWState extends State<WishListW> {
   final List<Map<String, dynamic>> wdesign= [
    {
      'newimage': 'Vendors_Venue_1.jpg',
      'texttitle': 'Radisson',
      'content': 'Lucknow in Banquet Hall',
      
    },
      {
      'newimage': 'Vendors_Venue_1.jpg',
      'texttitle': 'Radisson',
      'content': 'Lucknow in Banquet Hall',
      
    },
    {
      'newimage': 'Bookings_Bride_Makeup.jpg',
      'texttitle': 'Palak Sharma',
      'content': 'Bridal Makeup',
      
    },
   
  ];
  @override
  Widget build(BuildContext context) {
      
    return Scaffold( appBar: AppBar(
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
        title: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.19 ,),
          child: const Text(
            'WishList',
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
        height: double.maxFinite,
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
        child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 1,
                  spacing: 6,
                  children: [
                    ...wdesign.map(
                      (vendor) => WishListdesign(
                        vendor['newimage']!,
                        vendor['texttitle']!,
                        vendor['content']!,
                        
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