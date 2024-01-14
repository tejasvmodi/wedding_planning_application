import 'package:flutter/material.dart';

Widget feature(String assetpath, String text, double fontSize, BuildContext context, Widget redirectPage) {
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
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: fontSize,
              letterSpacing: 0,
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            child: Image(
              image: AssetImage(assetpath),
              fit: BoxFit.cover,
              height: 150,
              width: 160,
              opacity: AlwaysStoppedAnimation(1),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => redirectPage));
            },
          ),
        ],
      ),
    ),
  );
}
