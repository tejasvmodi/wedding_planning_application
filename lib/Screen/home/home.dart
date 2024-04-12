import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/screen/home/components/appbar_home.dart';
import 'package:wedding_planning_application/services/Couple/couple.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/screen/emergency_contacts/emergency_contact_list.dart';
import 'package:wedding_planning_application/screen/home/components/carousel_slide_home.dart';
import 'package:wedding_planning_application/screen/home/components/category_wrapper.dart';
import 'package:wedding_planning_application/screen/home/components/feature.dart';
import 'package:wedding_planning_application/screen/other_screens/budget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Coupleservice getcouple1 = Coupleservice();
  List<Getcouple> updatedCoupleList = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation
    _controller.forward();
    setState(() {
      getServiceCategories();
      fetchAndSaveCoupleData();
    });
  }

  List<ServiceCategory> items = [];
  Future<void> fetchAndSaveCoupleData() async {
    List<Getcouple> newCouples = await getcouple1.getcoupleservice();

    final Getcouple? storedCouple = await getCouple();

    if (newCouples.isNotEmpty) {
      Getcouple? newCoupleToSave;
      if (storedCouple != null) {
        bool foundMatchingStoredCouple = false;
        for (Getcouple couple in newCouples) {
          if (couple == storedCouple) {
            foundMatchingStoredCouple = true;
            break;
          }
        }
        if (!foundMatchingStoredCouple) {
          newCoupleToSave = newCouples.first;
        }
      } else {
        newCoupleToSave = newCouples.first;
      }

      if (newCoupleToSave != null) {
        await saveCouple(newCoupleToSave);

        setState(() {
          updatedCoupleList = newCouples;
          log(newCoupleToSave.toString());
        });
      } else {
        log('No new couples to save.');
      }
    } else {
      log('No couples fetched from the service.');
    }
  }

  Future<void> getServiceCategories() async {
    final ServicecategoryService categoryService = Get.find();
    await categoryService.getServicecategories().then((value) {
      setState(() {
        items = value.items;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white, size: 35),
        actions: const [AppbarHome()],
      ),
      drawer: const Drawer123(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 235, 255, 1),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CarouselSlideHome(),
              Container(
                height: MediaQuery.of(context).size.width * 0.12,
                color: const Color.fromRGBO(85, 32, 32, 1),
                child: Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  child: const Center(
                    child: Text(
                      '120 days until big day',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 25,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.02,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: items.isEmpty
                    ? Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _animation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(2, 2),
                                            blurRadius: 08,
                                            spreadRadius: 2,
                                            blurStyle: BlurStyle.solid,
                                          ),
                                        ],
                                      ),
                                      // Add child widgets here if needed
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _animation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(2, 2),
                                            blurRadius: 08,
                                            spreadRadius: 2,
                                            blurStyle: BlurStyle.solid,
                                          ),
                                        ],
                                      ),
                                      // Add child widgets here if needed
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _animation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(2, 2),
                                            blurRadius: 08,
                                            spreadRadius: 2,
                                            blurStyle: BlurStyle.solid,
                                          ),
                                        ],
                                      ),
                                      // Add child widgets here if needed
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Opacity(
                                    opacity: _animation.value,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.4),
                                            offset: const Offset(2, 2),
                                            blurRadius: 08,
                                            spreadRadius: 2,
                                            blurStyle: BlurStyle.solid,
                                          ),
                                        ],
                                      ),
                                      // Add child widgets here if needed
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(children: [
                        for (int i = 0; i < items.length; i++)
                          categoryWrapper(
                            items[i].icon.toString(),
                            items[i].serviceCategoryName.toString(),
                            context,
                            items[i].serviceCategoryId,
                          ),
                      ]),
              ),
              const Divider(
                color: Color.fromARGB(50, 0, 0, 0),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.04,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Row(
                        children: [
                          feature(
                              'assets/images/Checklist.jpg',
                              'CheckList',
                              26,
                              context,
                              ScreenNavigation(
                                currentIndex: 1,
                              )),
                          feature('assets/images/Budget.jpg', 'Budget', 26,
                              context, const Budget()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.0,
                        right: MediaQuery.of(context).size.width * 0.04,
                      ),
                      child: Row(
                        children: [
                          feature(
                              'assets/images/Vendors.jpg',
                              'Vendor',
                              26,
                              context,
                              ScreenNavigation(
                                currentIndex: 2,
                              )),
                          feature(
                              'assets/images/emergency.jpg',
                              'Emergency Contanct',
                              18,
                              context,
                              const EmergencycontlistW()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 195),
                      child: feature(
                        'assets/images/Ceremoney.jpg',
                        'Ceremony',
                        26,
                        context,
                        ScreenNavigation(
                          currentIndex: 2,
                        ),
                      ),
                    ),
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
