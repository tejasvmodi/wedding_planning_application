import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/models/GetVendor/getvendorbyserviceitem.dart';
import 'package:wedding_planning_application/models/service_itemmodel.dart';
import 'package:wedding_planning_application/models/wishlist.dart';
import 'package:wedding_planning_application/repository/vendor/getvendorbyserviceitem.dart';
import 'package:wedding_planning_application/screen/booking/book_service/book_service.dart';
import 'package:wedding_planning_application/services/GetVendor/getvendor.dart';
import 'package:wedding_planning_application/services/vendor_service.dart';
import 'package:url_launcher/url_launcher.dart';

class VendorSingleView extends StatefulWidget {
  const VendorSingleView({
    super.key,
    required this.serviceid,
    this.description,
  });
  final int serviceid;
  final String? description;

  @override
  State<VendorSingleView> createState() => _VendorSingleViewState();
}

class _VendorSingleViewState extends State<VendorSingleView> {
  List<ServiceitemModel> itemdata = [];
  VendorService vendor = VendorService();
  int flag = 0;
  List<GetVendorServiceitem> service = [];
  GetVendorbyService vendorser = GetVendorbyService();
  GetVendorService get = GetVendorService();
  List<GetVendorServiceitem> vendordata = [];

  @override
  void initState() {
    super.initState();
    getserviceitemdata();
  }

  void _launchWhatsApp(String phone) async {
    String url = 'https://wa.me/$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getserviceitemdata() async {
    try {
      itemdata = await vendor.getserviceitem(widget.serviceid);
      if (itemdata.isNotEmpty) {
        vendordata = await get.getvendordata(itemdata[0].serviceItemId);
        setState(() {
          vendordata;
          log(vendordata.toString());
        });
      }
      setState(() {
        itemdata;
      });
    } catch (e) {
      log('Error fetching service data: $e');
    }
  }

  double? _ratingValue;
  int j = 0;
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
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.23),
          child: const Text(
            'Venues',
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
              onPressed: () {
                Get.to(() => const WishListW());
              },
              icon: Icon(
                MdiIcons.heartOutline,
                size: MediaQuery.of(context).size.height * 0.056,
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          )
        ],
      ),
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
          child: Column(
            children: [
               const Divider(color: Colors.black,),
              // SizedBox(
              //     height: MediaQuery.of(context).size.height * 0.07,
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: const Color.fromRGBO(255, 217, 249, 1),
              //         border: Border.all(
              //           color: const Color.fromRGBO(111, 80, 80, 1),
              //           width: 1,
              //         ),
              //       ),
                    // child: Row(
                    //   crossAxisAlignment: CrossAxisAlignment.stretch,
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           MdiIcons.tuneVertical,
                    //           size: MediaQuery.of(context).size.height * 0.056,
                    //         )),
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.search,
                    //           size: MediaQuery.of(context).size.height * 0.056,
                    //         )),
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           MdiIcons.bookmarkOutline,
                    //           size: MediaQuery.of(context).size.height * 0.056,
                    //         )),
                    //   ],
                    // ),
                  // )),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        if (itemdata.isEmpty)
                          const Center(
                              heightFactor: 5,
                              child: CircularProgressIndicator()),
                        if (itemdata.isNotEmpty)
                          FirstItemDetails(
                            itemName: itemdata[j].itemName,
                            images: itemdata[j].images,
                            approxprice: itemdata[j].approxPrice.toInt(),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        if (itemdata.length > 1)
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(itemdata.length, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          const MaterialStatePropertyAll(
                                              Color.fromRGBO(77, 43, 43, 1)),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      )),
                                    ),
                                    onPressed: () {
                                      j = index;
                                      flag = index;
                                      setState(() {});
                                    },
                                    child: Text(
                                      itemdata[index].itemName,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'EBGaramond',
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                          height: 1),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            RatingBar(
                                maxRating: 5,
                                minRating: 1,
                                itemSize:
                                    MediaQuery.of(context).size.height * 0.035,
                                initialRating: 2.5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                ratingWidget: RatingWidget(
                                    full: const Icon(Icons.star,
                                        color:
                                            Color.fromRGBO(147, 118, 118, 1)),
                                    half: const Icon(
                                      Icons.star_half,
                                      color: Color.fromRGBO(147, 118, 118, 1),
                                    ),
                                    empty: const Icon(
                                      Icons.star_outline,
                                      color: Color.fromRGBO(176, 132, 132, 1),
                                    )),
                                onRatingUpdate: (value) {
                                  setState(() {
                                    _ratingValue = value;
                                  });
                                }),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const Text(
                              'Rating : ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(85, 32, 32, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            Text(
                              _ratingValue != null
                                  ? _ratingValue.toString()
                                  : '2.5',
                              style: const TextStyle(
                                  color: Color.fromRGBO(85, 32, 32, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                            ),
                            const Text(
                              '5,310 Reviews',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(85, 32, 32, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(13),
                          child: widget.description != null
                              ? Text(
                                  widget.description!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 7,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                )
                              : const Text(
                                  'No description available',
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 15,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(13),
                          child: const Text(
                            'Property Amenities',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Free Parking ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      const Text(
                                        'Pool ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Free High Speed Internet(WI-FI)',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      const Text(
                                        'Fitness Center with Gym/Workout Room ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(13),
                          child: const Text(
                            'Room Features',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 20,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Allergy Free room ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      const Text(
                                        'Air Conditioning ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Bath rolls ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      const Text(
                                        'Desk ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 14,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.height * 0.21,
                                  height:
                                      MediaQuery.of(context).size.height * 0.06,
                                  child: TextButton(
                                      onPressed: () {
                                        if (vendordata.isNotEmpty) {
                                          _launchWhatsApp(
                                              "+91${vendordata[0].businesscontact}");
                                        }
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                                Color.fromRGBO(77, 43, 43, 1)),
                                        shape: MaterialStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                      ),
                                      child: const Text(
                                        'Inquiry',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'EBGaramond',
                                            fontSize: 20,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                            height: 1),
                                      ))),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.height * 0.21,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: TextButton(
                                  onPressed: () async {
                                    // Check if itemdata is not empty
                                    if (itemdata.isNotEmpty) {
                                      // Create a new Wishlistdata object with the item details
                                      Wishlistdata newItem = Wishlistdata(
                                        id: widget.serviceid,
                                        description:
                                            widget.description.toString(),
                                        name: itemdata[0].itemName,
                                        image: itemdata[0].images[0].toString(),
                                      );

                                      // Get the current list of wishlist items from SharedPreferences
                                      List<Wishlistdata> currentList =
                                          await getWishlistdataList();

                                      // Check if the item is already in the wishlist
                                      bool alreadyExists = currentList
                                          .any((item) => item.id == newItem.id);

                                      // If the item does not already exist in the wishlist, add it
                                      if (!alreadyExists) {
                                        currentList.add(newItem);
                                        await saveWishlistdataList(currentList);
                                      }

                                      // Navigate to the WishListW screen
                                      Get.to(() => const WishListW());
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromRGBO(77, 43, 43, 1)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                  ),
                                  child: const Text(
                                    'Add To Favorite',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'EBGaramond',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.03,
                              bottom: 15),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: TextButton(
                                  onPressed: () {
                                    // Get.to(() => const bookservicew());
                                    log(itemdata[flag].images[0].toString());
                                    Get.to(() => bookservicew(
                                          servicebookingId:
                                              itemdata[flag].serviceItemId,
                                          approxprice: itemdata[flag]
                                              .approxPrice
                                              .toInt(),
                                          servicename: itemdata[flag].itemName,
                                          image: itemdata[flag]
                                              .images[0]
                                              .toString(),
                                        ));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Color.fromRGBO(77, 43, 43, 1)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                  ),
                                  child: const Text(
                                    'Book Now',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'EBGaramond',
                                        fontSize: 20,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400,
                                        height: 1),
                                  ))),
                        )
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}

class FirstItemDetails extends StatefulWidget {
  final String itemName;
  final List<String> images;
  final int approxprice;
  const FirstItemDetails({
    super.key,
    required this.itemName,
    required this.images,
    required this.approxprice,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FirstItemDetailsState createState() => _FirstItemDetailsState();
}

class _FirstItemDetailsState extends State<FirstItemDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.02,
            top: MediaQuery.of(context).size.height * 0.036,
            left: MediaQuery.of(context).size.height * 0.02,
            right: MediaQuery.of(context).size.height * 0.036,
          ),
          alignment: Alignment.topLeft,
          child: Text(
            widget.itemName,
            textAlign: TextAlign.left,
            style: const TextStyle(
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: 28,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.32,
          width: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  widget.images.isNotEmpty ? widget.images[0] : ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Row(
              children: List.generate(
                  widget.images.length > 1 ? widget.images.length - 1 : 0,
                  (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.01,
                  ),
                  child: Image(
                    image: NetworkImage(widget.images[index + 1]),
                    width: MediaQuery.of(context).size.height * 0.15,
                    height: MediaQuery.of(context).size.height * 0.135,
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Approximately Price :  ${widget.approxprice}',
            style: const TextStyle(
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: 20,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
      ],
    );
  }
}
