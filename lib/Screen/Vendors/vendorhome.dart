import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20SIngle%20List%20Screen/VendorSingleList.dart';
import 'package:wedding_planning_application/Screen/Vendors/vendor%20screen%20components/vendorbox.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';

class vendorhome extends StatefulWidget {
  const vendorhome({super.key});

  @override
  State<vendorhome> createState() => _vendorhomeState();
}

class _vendorhomeState extends State<vendorhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        
          title: Padding(
            padding: EdgeInsets.only(left:  MediaQuery.of(context).size.width * 0.19,),
            child: const Text(
              'Vendors',
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
          actions: [
            IconButton(
                onPressed: () {   Get.to(() => const WishListW());},
                icon: Icon(
                  MdiIcons.heartOutline,
              size:  MediaQuery.of(context).size.height * 0.056,
                )),
            SizedBox(
              width:  MediaQuery.of(context).size.width * 0.01,
            )
          ],
        ),
        drawer: const Drawer123(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 231, 255, 1),
                  Color.fromRGBO(255, 219, 249, 1),
                ]),
          ),
          child: Column(children: [
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.07,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 217, 249, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(111, 80, 80, 1),
                    width: 1,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.tuneVertical,
                          size:  MediaQuery.of(context).size.height * 0.056,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                         size:  MediaQuery.of(context).size.height * 0.056,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          MdiIcons.bookmarkOutline,
                         size:  MediaQuery.of(context).size.height * 0.056,
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    VendorBox('assets/images/Vender_Venue.jpg', 'Venue',
                        'Lawns/Farmhouse,Banquet Halls, Resorts,\nSmall Function Hall,Destination Wedding,\nHotels',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox('assets/images/Vender_Mackup.jpg', 'MakeUp',
                        'Bridal Makeup,Family Makeup,Jewellery,\nAccessories',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox(
                        'assets/images/vender_photography.jpg',
                        'Photography',
                        'Pre-Wedding Shoot,Photographers,\nVideographers',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox('assets/images/Vendor_carting.jpg', 'Catering',
                        'Catering Services,Food Stalls,Bartenders,\nHome Catering, Cake',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox(
                        'assets/images/Vendor_bridal_wear.jpg',
                        'Bridal wear',
                        'Bridal Lehengas,Silk Sarees,\nWedding Gowns, Trousseau Sarees',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox('assets/images/vendor_Groom_wear.jpg',
                        'Groom Wear', 'Wedding Suits/Tuxes, Sherwani',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox('assets/images/vendors_wedding_decor.jpg',
                        'Planning and decor', 'Decorators, Wedding Planners',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox(
                        'assets/images/vendors_musicandDjs.jpg',
                        'Music and Dance',
                        'Wedding Entertainment, Djs,\nChoreographer',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                    VendorBox(
                        'assets/images/Vendor_invitations.jpg',
                        'Invites and gifts',
                        'Invitation gifts, Invitations, Favors,\nTrousseau Packers',const VendorSingleList(),context),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}
