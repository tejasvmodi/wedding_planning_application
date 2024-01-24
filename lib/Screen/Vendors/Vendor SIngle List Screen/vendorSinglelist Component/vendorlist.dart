import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

vendorList(String imagedata, String texttitle, String textdata) {
  return SizedBox(
    height: 280,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 200,
                width: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imagedata), fit: BoxFit.cover),
                    border: Border.all(color: Colors.black38, width: 2),
                    boxShadow: const [
                      BoxShadow(
                          blurStyle: BlurStyle.normal,
                          blurRadius: 2,
                          spreadRadius: 4,
                          color: Colors.black12)
                    ]),
              )),
          Positioned(
              top: 155,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.bookmarkOutline,
                        size: 25,
                        color: Colors.white,
                      )),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      children: [
                        TextSpan(
                          text: '$texttitle\n',
                        ),
                        const WidgetSpan(
                          child: SizedBox(height: 15),
                        ),
                        const TextSpan(
                          text: 'Lukhnow in Banquet Hall',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        MdiIcons.heartOutline,
                        size: 30,
                        color: Colors.white,
                      )),
                ],
              )),
          Positioned(
            left: 0,
            bottom: 0,
            child: SizedBox(
                width: 190,
                height: 50,
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(77, 43, 43, 1)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      )),
                    ),
                    child: const Text(
                      'Know More',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'EBGaramond',
                          fontSize: 25,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w400,
                          height: 1),
                    ))),
          )
        ],
      ),
    ),
  );
}
