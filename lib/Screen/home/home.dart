import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/components/DotsIndicator.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';
import 'package:wedding_planning_application/Screen/home/CarouselSlideHome.dart';
import 'package:wedding_planning_application/Screen/home/appbarHome.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           CarouselSlideHome(),
          ],
        ),
      ),
    );
  }
}
