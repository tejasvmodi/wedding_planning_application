
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/components/DotsIndicator.dart';

class CarouselSlideHome extends StatefulWidget {
  const CarouselSlideHome({super.key});

  @override
  State<CarouselSlideHome> createState() => _CarouselSlideHomeState();
}

class _CarouselSlideHomeState extends State<CarouselSlideHome> {
 final List<String> items = [
    'assets/images/HomeSliderImg1.jpg',
    'assets/images/HomeSliderImg2.jpg',
    'assets/images/HomeSliderImg.png',
  ];
  int activeIndex = 0; // Use int for index
  final CarouselController _controller = CarouselController(); // Create controller

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                
                  height: 350.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 500),
                  viewportFraction: 1.0,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  }),
              items: items.map((assetPath) {
                return Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        assetPath,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 320,left: 150),
                      child: dots(items,activeIndex),
                    )
                  ],
                );
              }).toList(),
            );
  }
}