import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/wishlist.dart';
import 'package:wedding_planning_application/screen/vendor/vendor_single_view.dart';

Widget WishListdesign(String newimage, String textdata,int id,String description) {
  BuildContext context = Get.context!;
  return Container(
    padding: const EdgeInsets.only(top: 10, left: 4),
    width: MediaQuery.of(context).size.width / 2 - 12.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            boxShadow: const [
              BoxShadow(blurRadius: 2),
              BoxShadow(blurRadius: 3, spreadRadius: 1, blurStyle: BlurStyle.inner),
            ],
            image: DecorationImage(
              image: NetworkImage(newimage),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    textdata,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  deleteWishlistdata(id);
                  Get.back();
                },
                icon: Icon(
                  MdiIcons.close,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.23,
              child: TextButton(
                onPressed: () {
                  Get.to(() => VendorSingleView(serviceid: id, description: description));
                },
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color.fromRGBO(96, 67, 67, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
                ),
                child: const Text(
                  'view',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.21,
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(96, 67, 67, 1))),
                child: const Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
