import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/CarouselSlideHome.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/appbarHome.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/categorywrapper.dart';
import 'package:wedding_planning_application/Screen/home/HomeScreen%20Component/feature.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
      drawer: Drawer123(),
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
                height: 50,
                color: const Color.fromRGBO(85, 32, 32, 1),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
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
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryWrapper('assets/images/Vanues.jpg', 'Venue',
                        context, const Login_form()),
                    categoryWrapper('assets/images/catering.jpg', 'Catering',
                        context, const Login_form()),
                    categoryWrapper('assets/images/PhotoShoot.jpg',
                        'Photo Shoot', context, const Login_form()),
                    categoryWrapper('assets/images/Decor.jpg', 'Decoration',
                        context, const Login_form()),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(50, 0, 0, 0),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 10, right: 10),
                      child: Row(
                        children: [
                          feature('assets/images/Checklist.jpg', 'CheckList',
                              26, context, const Login_form()),
                          feature('assets/images/Budget.jpg', 'Budget', 26,
                              context, const Login_form()),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, left: 10, right: 10),
                      child: Row(
                        children: [
                          feature('assets/images/Vendors.jpg', 'Vendor', 26,
                              context, const Login_form()),
                          feature(
                              'assets/images/emergency.jpg',
                              'Emergency Contanct',
                              18,
                              context,
                              const Login_form()),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 185),
                      child: feature('assets/images/Ceremoney.jpg', 'Ceremony',
                          26, context, const Login_form()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
