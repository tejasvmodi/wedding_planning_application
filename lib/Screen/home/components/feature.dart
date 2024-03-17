import 'package:flutter/material.dart';

Widget feature(String assetpath, String text, double fontSize,
    BuildContext context, Widget redirectPage) {
  return Align(
    child: SizedBox(
      height: 200,
      width: 180,
      child: Column(
        children: [
          Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: const Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: fontSize,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: const Offset(2, 2),
                  blurRadius: 10,
                  spreadRadius: 6,
                  
                ),
              ],
            ),
            child: InkWell(
              child: Image(
                image: AssetImage(assetpath),
                fit: BoxFit.cover,
                height: 150,
                width: 160,
                opacity: const AlwaysStoppedAnimation(1),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => redirectPage));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
