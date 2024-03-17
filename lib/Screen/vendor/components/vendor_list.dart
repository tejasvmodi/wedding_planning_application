import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/screen/vendor/vendor_single_view.dart';

Widget vendorList(
    String imagedata, String texttitle, String textdata, BuildContext context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width / 2 -
        12.0, // Divide by the number of photos per row
    height: MediaQuery.of(context).size.height * 0.34,
    child: Stack(
      children: [
        Positioned(
          top: MediaQuery.of(context).size.height * 0,
          left: MediaQuery.of(context).size.height * 0.0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.44,
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
          top: MediaQuery.of(context).size.height * 0.19,
          left: -6,
          child: Container(
            margin: EdgeInsetsDirectional.zero,
            width: MediaQuery.of(context).size.width * 0.47,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const WishListW());
                  },
                  icon: Icon(
                    MdiIcons.bookmarkOutline,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    // constraints:  BoxConstraints(
                    //   maxWidth: MediaQuery.of(context).size.width * 0.37,
                    // ),
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
                          WidgetSpan(
                            child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
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
                    Icon(
                      MdiIcons.heart,
                      size: 30,
                      color: Colors.black,
                    );
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
            margin: EdgeInsets.only(
                top: 0, bottom: MediaQuery.of(context).size.height * 0.02),
            width: MediaQuery.of(context).size.width * 0.445,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextButton(
              onPressed: () {
                Get.to(() => VendorSingleView(
                      imagedata: imagedata,
                      name: texttitle,
                    ));
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
