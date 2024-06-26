import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/screen/common_components/dots_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activePage = 0;
  bool stopAutoplay = false;

  final List<Map<String, String>> imageData = [
    {
      'imagePath': 'assets/images/splash1.jpg',
      'text':
          'A Stylish Event Begins Long Before the guests arrive . It Begins with masterful planning .',
    },
    {
      'imagePath': 'assets/images/splash2.jpg',
      'text': 'Creative and elegant event design and planning. ',
    },
    {
      'imagePath': 'assets/images/splash3.jpg',
      'text': 'From smallest details to grandest event ',
    },
    // Add more image paths and text as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          colorBlendMode: BlendMode.darken,
                          filterQuality: FilterQuality.medium,
                        ),
                        Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.09,
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width * 0.04,
                              left: MediaQuery.of(context).size.width * 0.04,
                              right: MediaQuery.of(context).size.width * 0.04,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.4), // Shadow color
                                  // Specify the offset of the shadow
                                  blurRadius: 10 , // Specify the blur radius
                                  spreadRadius: 2, 
                                  blurStyle: BlurStyle.inner// Specify the spread radius
                                ),
                              ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                ]),
                          ),
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
                                  Get.to(() => const LoginForm());
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
                          left: MediaQuery.of(context).size.width * 0.40,
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
    );
  }
}
