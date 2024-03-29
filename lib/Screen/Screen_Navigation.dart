import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Profile/profile.dart';
import 'package:wedding_planning_application/Screen/home/home.dart';
import 'package:wedding_planning_application/Screen/inspiration_screen/inspiration.dart';
import 'package:wedding_planning_application/screen/checklist/check_list.dart';
import 'package:wedding_planning_application/screen/vendor/vendor_home.dart';

// ignore: must_be_immutable
class ScreenNavigation extends StatefulWidget {
  ScreenNavigation({super.key, this.currentIndex = 0});
  int currentIndex;

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  final List<Widget> list = [
    const Home(),
    const CheckListW(),
    const VendorHome(),
    const InspirationW(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        maintainBottomViewPadding: true,
        child: Container(
          color: Colors.greenAccent.withOpacity(0.1),
          child: list[widget.currentIndex],
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
            icon: widget.currentIndex == 0
                ? Icon(MdiIcons.home, size: 35)
                : Icon(MdiIcons.homeOutline, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 1
                ? Icon(MdiIcons.listBox, size: 35)
                : Icon(MdiIcons.listBoxOutline, size: 35),
            label: 'CheckList',
            tooltip: 'CheckList',
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 2
                ? Icon(MdiIcons.store, size: 35)
                : Icon(MdiIcons.storeOutline, size: 35),
            label: 'Vendors',
            tooltip: 'Vendors',
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 3
                ? Icon(MdiIcons.lightbulb, size: 35)
                : Icon(MdiIcons.lightbulbOutline, size: 35),
            label: 'Inspiration',
            tooltip: 'Inspiration',
          ),
          BottomNavigationBarItem(
            icon: widget.currentIndex == 4
                ? Icon(MdiIcons.account, size: 35)
                : Icon(MdiIcons.accountOutline, size: 35),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
      ),
    );
  }
}
