import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/screen/vendor/components/vendor_list.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';
import 'package:wedding_planning_application/models/servicemodel.dart';

class VendorSingleList extends StatefulWidget {
  final int servicecategoryId;

  VendorSingleList(this.servicecategoryId, {Key? key}) : super(key: key);

  @override
  State<VendorSingleList> createState() => _VendorSingleListState();
}

class _VendorSingleListState extends State<VendorSingleList> {
  final VendorService vendorService = Get.find();
  List<Service> data = [];

  @override
  void initState() {
    super.initState();
    getservicedata();
  }

  Future<void> getservicedata() async {
    try {
      data = await vendorService.getServiceData(widget.servicecategoryId);
      setState(() {
        data;
      });
    } catch (e) {
      log('Error fetching service data: $e');
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
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
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
            ],
          ),
        ),
        child: Column(
          children: [
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
            FutureBuilder<List<Service>>(
              future: vendorService.getServiceData(widget.servicecategoryId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display circular progress indicator while loading
                  return const Padding(
                    padding: EdgeInsets.all(22.0),
                    child: Center(
                      heightFactor: 15,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  // Display error message if data fetch fails
                  return Center(
                    child: Text('Failed to load data: ${snapshot.error}'),
                  );
                } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      heightFactor: 10,
                      widthFactor: 10,
                      child: Text(
                        'Sorry, no vendors are registered for this service category.',
                        style: TextStyle(
                          color: Color.fromRGBO(85, 32, 32, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 22,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  );
                } else {
                  // Display the list of vendors
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Wrap(
                        runSpacing: 2,
                        spacing: 8,
                        children: snapshot.data!
                            .map((vendor) => vendorList(
                                  vendor.serviceImage,
                                  vendor.serviceName,
                                  vendor.serviceLocation,
                                  context,
                                ))
                            .toList(),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
