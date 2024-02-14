import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Chat%20Screen/chatinbox.dart';

class AppbarHome extends StatefulWidget {
  const AppbarHome({super.key});

  @override
  State<AppbarHome> createState() => _AppbarHomeState();
}

class _AppbarHomeState extends State<AppbarHome> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          const SizedBox(
            height: 40,
            width: 250,
            child: TextField(
              
              style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w300,
                        height: 1),
              decoration: InputDecoration( 
                
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  label: Text(
                    'Search...',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                        height: 1),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  fillColor: Color.fromRGBO(53, 22, 22, 0.6399999856948853),
                  filled: true,),
                 
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          IconButton(
              onPressed: () {
                Get.to(const ChatInboxW());
              },
              icon: Icon(
                MdiIcons.messageText,
                size: 35,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
