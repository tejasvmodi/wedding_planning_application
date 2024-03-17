import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/service_category.dart';
import 'package:wedding_planning_application/Models/variation.dart';
import 'package:wedding_planning_application/Models/variationoptionmodel.dart';
import 'package:wedding_planning_application/Repository/Vendor/service_category.dart';
import 'package:wedding_planning_application/Repository/Vendor/variation.dart';
import 'package:wedding_planning_application/Repository/Vendor/variationoption.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20SIngle%20List%20Screen/VendorSingleList.dart';
import 'package:wedding_planning_application/Screen/Vendors/vendor%20screen%20components/vendorbox.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';

class vendorhome extends StatefulWidget {
  const vendorhome({super.key});

  @override
  State<vendorhome> createState() => _vendorhomeState();
}

class _vendorhomeState extends State<vendorhome> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  VariationRepo varRepo = VariationRepo();
  variationoptionmodelOptionRepo varOptionRepo =
      variationoptionmodelOptionRepo();
  List<service_Category> items = [];
  List<Map<String, dynamic>> combinedDataList = [];

  Future<void> fetchData() async {
    final repository = ContentRepository<service_Category>();

    try {
      final Content<List<service_Category>> content =
          await repository.fetchData();
      items.addAll(content.items);
      for (service_Category category in items) {
        final variationContent =
            await varRepo.fetchData1(category.serviceCategoryId.toString());
        final List<variation> variations = variationContent.items;

        for (variation variation1 in variations) {
          final optionContent =
              await varOptionRepo.fetchData2(variation1.variationId.toString());
          final List<variationoptionmodel> variationOptions =
              optionContent.items;

          for (variationoptionmodel option in variationOptions) {
            combinedDataList.add({
              'serviceCategoryName': category.serviceCategoryName,
              'imageLink': category.icon,
              'variationId': variation1.variationId,
              'variationOptionId': option.variationOptionId,
              'variationOptionName': option.variationOptionName,
            });
          }
        }
      }

      // Group data by service category name
      Map<String, List<Map<String, dynamic>>> groupedData = {};

      combinedDataList.forEach((element) {
        String categoryName = element['serviceCategoryName'];
        if (!groupedData.containsKey(categoryName)) {
          groupedData[categoryName] = [element];
        } else {
          groupedData[categoryName]?.add(element);
        }
      });

      List<Map<String, dynamic>> groupedDataList = [];

      groupedData.forEach((categoryName, categoryData) {
        List<Map<String, dynamic>> categoryList = categoryData.map<Map<String, dynamic>>((element) {
          return {
            'serviceCategoryName': categoryName,
            'imageLink': element['imageLink'],
            'variationId': element['variationId'],
            'variationOptionId': element['variationOptionId'],
            'variationOptionName': element['variationOptionName'],
          };
        }).toList();
        
        groupedDataList.addAll(categoryList);
      });

      log('${groupedDataList.toString()}\n');
      setState(() {});
    } catch (e) {
      print('$e');
    }
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
          Container(
            height: MediaQuery.of(context).size.height,
            child: Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    // ListView.builder(
                    //   itemCount: groupedDataList.length,
                    //   itemBuilder: (context, index) {
                    //     final element = groupedDataList[index];
                    //     return VendorBox(
                    //       element['imageLink'],
                    //       element['serviceCategoryName'],
                    //       element['variationOptionId'],
                    //       VendorSingleList(),
                    //       context,
                    //     );
                    //   },
                    // ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
