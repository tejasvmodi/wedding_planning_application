import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckListW extends StatefulWidget {
  const CheckListW({Key? key}) : super(key: key);

  @override
  State<CheckListW> createState() => _CheckListWState();
}

class _CheckListWState extends State<CheckListW> {
  bool allSelected = false;

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
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
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
              height: 1,
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(237, 170, 237, 1),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                allSelected = !allSelected;
              });
            },
            icon: Icon(
              allSelected ? MdiIcons.refresh : MdiIcons.check,
              size: 30,
              color: const Color.fromRGBO(62, 53, 53, 1),
            ),
          ),
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
            ],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
              5, // Change this to the number of rows you want
              (index) => buildRow(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(int index) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/icon_bride.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            const Text(
              'Bride',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(62, 53, 53, 1),
                fontFamily: 'EBGaramond',
                fontSize: 30,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            )
          ],
        ),
        const Divider(
          indent: 15,
          endIndent: 12,
          color: Color.fromRGBO(62, 53, 53, 1),
        ),
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              allSelected ? MdiIcons.refresh : MdiIcons.check,
              size: 30,
              color: const Color.fromRGBO(62, 53, 53, 1),
            ),
            const SizedBox(
              width: 25,
            ),
            const Text(
              'Set a Date',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(62, 53, 53, 1),
                fontFamily: 'EBGaramond',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ],
        ),
        const Divider(
          indent: 15,
          endIndent: 12,
          color: Color.fromRGBO(62, 53, 53, 1),
        ),
      ],
    );
  }
}
