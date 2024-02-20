import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Booking/Book%20service/bookservice.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/Screen/otherscreens/inquiry.dart';

class vendorsingleview extends StatefulWidget {
  const vendorsingleview({super.key, required this.name, required this.imagedata});
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
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
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
              onPressed: () {   Get.to(() => const WishListW());},
              icon: Icon(
                MdiIcons.heartOutline,
                size: 40,
              )),
          const SizedBox(
            width: 5,
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
                  height: 60,
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
                              size: 45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              size: 45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MdiIcons.bookmarkOutline,
                              size: 45,
                            )),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          alignment: Alignment.topLeft,
                          child:  Text(
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
                          height: 300,
                          width: 360,
                          decoration:  BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  widget.imagedata,
                                ),
                                opacity: 1),
                          ),
                        ),
                        const SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 13,
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Vendor_Single_View_2.jpg'),
                                  width: 112,
                                  height: 112,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Vendor_Single_View_3.jpg'),
                                  width: 112,
                                  height: 112,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Vendor_Single_View_4.jpg'),
                                  width: 112,
                                  height: 112,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 13),
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/Vendor_Single_View_4_.jpg'),
                                  width: 112,
                                  height: 112,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 13,
                            ),
                            RatingBar(
                                maxRating: 5,
                                minRating: 1,
                                itemSize: 30,
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
                            const SizedBox(
                              width: 10,
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
                            const SizedBox(
                              width: 10,
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Free Parking ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Pool ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
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
                                        height: 10,
                                      ),
                                      Text(
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
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Allergy Free room ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Air Conditioning ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 70,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Bath rolls ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Desk ',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(85, 32, 32, 1),
                                          fontFamily: 'EBGaramond',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1),
                                    ),
                                  ],
                                )
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 160,
                                  height: 45,
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
                                  width: 170,
                                  height: 45,
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
                          padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                          child: SizedBox(
                              width: 370,
                              height: 50,
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
