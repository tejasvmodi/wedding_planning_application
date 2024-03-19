import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/data/vendor_data.dart';
import 'package:wedding_planning_application/screen/booking/wishlist/wishlist.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';

import 'components/vendor_box.dart';

class VendorHome extends StatefulWidget {
  const VendorHome({super.key});

  @override
  State<VendorHome> createState() => _VendorHomeState();
}

class _VendorHomeState extends State<VendorHome> {
  final VendorService vendorService = Get.find();
  List<VendorData> items = [];

  @override
  void initState() {
    super.initState();
    getVendorData();
  }

  Future<void> getVendorData() async {
    items = await vendorService.getVendorData();
    setState(() {
      items;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.19,
          ),
          child: const Text(
            'Vendors',
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
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          )
        ],
      ),
      drawer: const Drawer123(),
      body: Container(
        decoration: const BoxDecoration(
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
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: MediaQuery.of(context).size.height * 0.056,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      MdiIcons.bookmarkOutline,
                      size: MediaQuery.of(context).size.height * 0.056,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
        Expanded(
          
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: 
          Wrap( spacing: 8, children: [
                    ...items.map((vendor) => vendorBox(
                        vendor.category,
                        vendor.variationOptions,

                        context)),
                  ]),

                
    ),
  ),


        ]),
      ),
    );
  }
}
