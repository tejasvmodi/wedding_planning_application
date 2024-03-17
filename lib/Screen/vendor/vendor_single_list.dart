import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/screen/vendor/components/vendor_list.dart';

class VendorSingleList extends StatefulWidget {
  const VendorSingleList({super.key});

  @override
  State<VendorSingleList> createState() => _VendorSingleListState();
}

class _VendorSingleListState extends State<VendorSingleList> {
  final List<Map<String, String>> vendorData = [
    {
      'imagedata': 'assets/images/Vendors_Venue_1.jpg',
      'texttitle': 'Santaba hall dftrtrth',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_2.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_3.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_4.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_5.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_6.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_7.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_8.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_9.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_10.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_11.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_12.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_13.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    {
      'imagedata': 'assets/images/Vendors_Venue_1.jpg',
      'texttitle': 'Radisson',
      'textdata': 'Lukhnow in Banquet Hall',
    },
    // Add more vendor data as needed
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
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.21,
          ),
          child: const Text(
            'Venues',
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
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const WishListW());
              },
              icon: Icon(
                MdiIcons.heartOutline,
                size: MediaQuery.of(context).size.height * 0.056,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 231, 255, 1),
                Color.fromRGBO(255, 219, 249, 1),
              ]),
        ),
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 217, 249, 1),
                border: Border.all(
                  color: const Color.fromRGBO(111, 80, 80, 1),
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.tuneVertical,
                        size: MediaQuery.of(context).size.height * 0.056,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: MediaQuery.of(context).size.height * 0.056,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.bookmarkOutline,
                        size: MediaQuery.of(context).size.height * 0.056,
                      )),
                ],
              ),
            ),
          ),
          // vendorList('assets/images/Vendors_Venue_1.jpg', 'Radisson', 'Lucknow in Banquet hall'),
          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Wrap(runSpacing: 2, spacing: 8, children: [
                    ...vendorData.map((vendor) => vendorList(
                        vendor['imagedata']!,
                        vendor['texttitle']!,
                        vendor['textdata']!,
                        context)),
                  ]),
                )),
          ),
        ]),
      ),
    );
  }
}
