import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20single%20view%20Screen/vendorsingleview.dart';

Widget vendorList(
    String imagedata, String texttitle, String textdata, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 -
        12.0, // Divide by the number of photos per row
    height: 270.0,
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: 200,
            width: 170,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagedata),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.black38, width: 2),
              boxShadow: const [
                BoxShadow(
                  blurStyle: BlurStyle.normal,
                  blurRadius: 2,
                  spreadRadius: 4,
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: -6,
          child: Container(
            margin: EdgeInsetsDirectional.zero,
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MdiIcons.bookmarkOutline,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 180,
                    ),
                    child: RichText(
                       
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
                     overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Icon(MdiIcons.heart,
                    size: 30,
                    color: Colors.black,);
                  },
                  icon: Icon(
                    MdiIcons.heartOutline,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.only(top: 0, bottom: 13),
            width: 170,
            height: 50,
            child: TextButton(
              onPressed: () {
                Get.to(const vendorsingleview());
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(77, 43, 43, 1),
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
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
                  height: 1,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
