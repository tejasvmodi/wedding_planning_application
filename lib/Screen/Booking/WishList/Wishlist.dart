import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/wishlist.dart';
import 'package:wedding_planning_application/screen/booking/wishlist/components/wishlist_design.dart';

class WishListW extends StatefulWidget {
  const WishListW({super.key});

  @override
  State<WishListW> createState() => _WishListWState();
}

class _WishListWState extends State<WishListW> {
  List<Wishlistdata> wishlistDataList = [];
  @override
  void initState() {
    super.initState();
    getwishlistdata();
    setState(() {});
  }

  Future<void> getwishlistdata() async {
    wishlistDataList = await getWishlistdataList();
    setState(() {});
    for (var item in wishlistDataList) {
      log(item.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.19,
          ),
          child: const Text(
            'WishList',
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
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
            begin: Alignment(6.123234262925839e-17, 1),
            end: Alignment(-1, 6.123234262925839e-17),
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 231, 255, 1),
              Color.fromRGBO(255, 219, 249, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: wishlistDataList.isNotEmpty
              ? Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(8),
      child: Wrap(
        runSpacing: 1,
        spacing: 6,
        children: [
          ...wishlistDataList.map(
            (vendor) => WishListdesign(
              vendor.image,
              vendor.name,
              vendor.id,
              vendor.description
              
            ),
          )
        ],
      ),
    ),
  ],
)

              : Center(
                  heightFactor: 6,
                  child: Column(
                    children: [
                      Icon(
                        MdiIcons.cartOutline,
                        size: 80,
                      ),
                      const Text(
                        'Your Wishlist is empty 🤕🤕',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(85, 32, 32, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 25,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
