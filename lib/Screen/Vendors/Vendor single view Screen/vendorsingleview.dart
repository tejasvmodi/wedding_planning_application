import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/Book%20service/bookservice.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/Screen/otherscreens/inquiry.dart';

class vendorsingleview extends StatefulWidget {
  const vendorsingleview(
      {super.key, required this.name, required this.imagedata});
  final String name;
  final String imagedata;

  @override
  State<vendorsingleview> createState() => _vendorsingleviewState();
}

class _vendorsingleviewState extends State<vendorsingleview> {
  double? _ratingValue;
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
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
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
                              size: MediaQuery.of(context).size.height * 0.056,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              size: MediaQuery.of(context).size.height * 0.056,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MdiIcons.bookmarkOutline,
                              size: MediaQuery.of(context).size.height * 0.056,
                            )),
                      ],
                    ),
                  )),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.02,
                              top: MediaQuery.of(context).size.height * 0.036,
                              left: MediaQuery.of(context).size.height * 0.02,
                              right:
                                  MediaQuery.of(context).size.height * 0.036),
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.name,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                color: Color.fromRGBO(62, 53, 53, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 28,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.32,
                          width: MediaQuery.of(context).size.height * 0.45,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  widget.imagedata,
                                ),
                                fit: BoxFit.cover,
                                opacity: 1),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/Vendor_Single_View_2.jpg'),
                                    width: MediaQuery.of(context).size.height *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/Vendor_Single_View_3.jpg'),
                                    width: MediaQuery.of(context).size.height *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/Vendor_Single_View_4.jpg'),
                                    width: MediaQuery.of(context).size.height *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, right: 13),
                                  child: Image(
                                    image: const AssetImage(
                                        'assets/images/Vendor_Single_View_4_.jpg'),
                                    width: MediaQuery.of(context).size.height *
                                        0.15,
                                    height: MediaQuery.of(context).size.height *
                                        0.135,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
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
                          child: const Text(
                            'Nestled in serene south Goa, amidst lush 45 acres of landscaped gardens, swaying coconut palms and shimmering lagoons - the ITC Grand Goa, with direct access to the pristine Arossim beach, provides all the ingredients for an invigorating or intimate relaxed getaway.',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
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
                                        Get.to(() => const InquiryW());
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
                                      onPressed: () {
                                        Get.to(() => const WishListW());
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
                                        'Add To Favorite',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'EBGaramond',
                                            fontSize: 20,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                            height: 1),
                                      ))),
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
                                    Get.to(() => const bookservicew());
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
