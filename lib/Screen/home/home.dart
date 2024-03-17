import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Models/content.dart';
import 'package:wedding_planning_application/Models/service_category.dart';
import 'package:wedding_planning_application/Repository/Vendor/service_category.dart';
import 'package:wedding_planning_application/Screen/Emergency%20contancts/Emergencycontlist.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/CarouselSlideHome.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/appbarHome.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/categorywrapper.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/feature.dart';
import 'package:wedding_planning_application/Screen/otherscreens/Budget.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  void initState() {
    super.initState();

    setState(() {
      fetchData();
    });
  }

  // List<Widget> widgetList = [];
  List<service_Category> items = [];

  Future<void> fetchData() async {
    final repository = ContentRepository<service_Category>();

    try {
      final Content<List<service_Category>> content =
          await repository.fetchData();
      items.addAll(content.items);
      setState(() {
        
      });
    } catch (e) {
      print('$e');
    }
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
                child: Row(children: [
                  for (int i = 0; i < items.length; i++)
                    categoryWrapper(
                      items[i].icon,
                      items[i].serviceCategoryName,
                      context,
                      Screen_Navigation(
                        currentIndex: 2,
                      ),
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
                              Screen_Navigation(
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
                              Screen_Navigation(
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
                          Screen_Navigation(
                            currentIndex: 2,
                          ),
                        )),
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
