import 'package:flutter/material.dart';

class LocationW extends StatelessWidget {
  const LocationW({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 190, 221),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Location',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(85, 32, 32, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 238, 190, 221),
      body: const Center(
          child: Text('Comming Soon......',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color.fromRGBO(68, 45, 45, 1),
                  fontFamily: 'EBGaramond',
                  fontSize: 26,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1))),
    );
  }
}
