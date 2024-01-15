import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

class CheckListW extends StatefulWidget {
  const CheckListW({super.key});

  @override
  State<CheckListW> createState() => _CheckListWState();
}

class _CheckListWState extends State<CheckListW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color:Color.fromRGBO(62, 53, 53, 1),
            )),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'CheckList',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color.fromRGBO(62, 53, 53, 1),
                fontFamily: 'EBGaramond',
                fontSize: 30,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(237, 170, 237, 1),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.check,
                size: 30,
                color: const Color.fromRGBO(62, 53, 53, 1),
              )),
              
        ],
        
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 170, 255, 1),
                Color.fromRGBO(237, 170, 237, 1),

              ]),
        ),
        child:  Column(
          children: [
              Row(
                children: [
                  Image(image: AssetImage('assets/images/icon_bride.png'))
                ],
              )
          ],
        ),
      ),
    );
  }
}
