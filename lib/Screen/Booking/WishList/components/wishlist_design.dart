// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/vendor/vendor_single_view.dart';

WishListdesign(
    String newimage, String textdata, String content, BuildContext context) {
  return Container(
      padding: const EdgeInsets.only(top: 10, left: 4),
      height: 250,
      width: MediaQuery.of(context).size.width / 2 - 12.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.height * 0.02,
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                boxShadow: const [
                  BoxShadow(blurRadius: 2),
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.inner)
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/$newimage'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 18,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      children: [
                        TextSpan(
                          text: '$textdata\n',
                        ),
                        WidgetSpan(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                        TextSpan(
                          text: content,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        MdiIcons.close,
                        size: 30,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(96, 67, 67, 1),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    child: const Text(
                      'view',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.21,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => VendorSingleView(
                          name: textdata, imagedata: newimage));
                    },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(96, 67, 67, 1),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 25,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]));
}