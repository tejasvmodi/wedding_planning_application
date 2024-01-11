import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activePage = 0;
  bool stopAutoplay= false;
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
                    stopAutoplay = index==imageData.length-1;

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
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          top: 20.0,
                          left: 20.0,
                          child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                SizedBox(
                                  width: 345, // Adjust the width as needed
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

                        const SizedBox(height: 16.0),
                        if (activePage == imageData.length - 1)

                          // third page start button ... code
                          Positioned(
                            left: 110,
                            bottom: 90,
                            child: ElevatedButton(
                              onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Login_form(),));
                         
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

                        // if (activePage != imageData.length - 1)
                        Positioned(
                          left: 150,
                          bottom: 30,
                          child: Padding(
                            // dot indicator for .....started
                            padding: const EdgeInsets.only(top: 16.0),
                            child: DotsIndicator(
                              dotsCount: imageData.length,
                              position: activePage.toInt(),
                              decorator: const DotsDecorator(
                                size: Size.square(10.0),
                                activeSize: Size(20.0, 9.0),
                                color: Colors.grey, // Inactive dot color
                                activeColor: Color.fromRGBO(54, 29, 29, 1),
                                // Active dot color
                              ),
                            ),
                          ),
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
