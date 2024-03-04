import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/Screen/components/DotsIndicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activePage = 0;
  bool stopAutoplay = false;

  final List<Map<String, String>> imageData = [
    {
      'imagePath': 'assets/images/Splash1.jpg',
      'text':
          'A Stylish Event Begins Long Before the guests arrive . It Begins with masterful planning .',
    },
    {
      'imagePath': 'assets/images/splash2.jpg',
      'text': 'Creative and elegant event design and planning. ',
    },
    {
      'imagePath': 'assets/images/Splash3.jpg',
      'text': 'From smallest details to grandest event ',
    },
    // Add more image paths and text as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  autoPlay: !stopAutoplay,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activePage = index;
                      stopAutoplay = index == imageData.length - 1;
                    });
                  },
                ),
                items: imageData.map((data) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Image.asset(
                            data['imagePath']!,
                            opacity: const AlwaysStoppedAnimation(1),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.width * 0.04,
                            left: MediaQuery.of(context).size.width * 0.04,
                            right: MediaQuery.of(context).size.width * 0.04,
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                  SizedBox(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width, // Adjust the width as needed
                                    child: Text(
                                      data['text']!,
                                      style: const TextStyle(
                                        fontFamily: 'EBGaramond',
                                        color: Color.fromRGBO(255, 254, 254, 1),
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ])),
                          ),

                          if (activePage == imageData.length - 1)
                            // third page start button ... code
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.3,
                              bottom: MediaQuery.of(context).size.height * 0.12,
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: const Offset(2, 2),
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => Login_form());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    backgroundColor:
                                        const Color.fromRGBO(77, 43, 43, 1),
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  )),
                                ),
                              ),
                            ),

                          // if (activePage != imageData.length - 1)
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.43,
                            bottom: MediaQuery.of(context).size.height * 0.05,

                            // dot indicator for .....started

                            child: dots(imageData, activePage),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
