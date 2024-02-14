// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/CheckList/Checklist.dart';
import 'package:wedding_planning_application/Screen/Inspiration%20Screen/inspiration.dart';
import 'package:wedding_planning_application/Screen/Profile/profile.dart';
import 'package:wedding_planning_application/Screen/Vendors/vendorhome.dart';
import 'package:wedding_planning_application/Screen/home/home.dart';

class Screen_Navigation extends StatefulWidget {
  const Screen_Navigation({super.key});

  @override
  State<Screen_Navigation> createState() => _Screen_NavigationState();
}

class _Screen_NavigationState extends State<Screen_Navigation> {
  int _currentIndex = 0;

  final List<Widget> list = [
    home(),
    const CheckListW(),
    const vendorhome(),
     const InspirationW(),
    const ProfileW(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: Container(
          color: Colors.greenAccent.withOpacity(0.1),
          child: list[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(62, 53, 53, 1),
          fontFamily: 'EBGaramond',
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        selectedLabelStyle: const TextStyle(
          color: Color.fromRGBO(62, 53, 53, 1),
          fontFamily: 'EBGaramond',
          fontSize: 14,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
        selectedIconTheme: const IconThemeData(
          color: Color.fromRGBO(85, 32, 32, 1),
        ),
        backgroundColor: const Color.fromRGBO(244, 225, 225, 1),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(85, 32, 32, 1),
        items: [
          BottomNavigationBarItem(
            tooltip: 'Home',
            icon: _currentIndex == 0
                ? Icon(MdiIcons.home, size: 35)
                : Icon(MdiIcons.homeOutline, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Icon(MdiIcons.listBox, size: 35)
                : Icon(MdiIcons.listBoxOutline, size: 35),
            label: 'CheckList',
            tooltip: 'CheckList',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Icon(MdiIcons.store, size: 35)
                : Icon(MdiIcons.storeOutline, size: 35),
            label: 'Vendors',
            tooltip: 'Vendors',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Icon(MdiIcons.lightbulb, size: 35)
                : Icon(MdiIcons.lightbulbOutline, size: 35),
            label: 'Inspiration',
            tooltip: 'Inspiration',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Icon(MdiIcons.account, size: 35)
                : Icon(MdiIcons.accountOutline, size: 35),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
