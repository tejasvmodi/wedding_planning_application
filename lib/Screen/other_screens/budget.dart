import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
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
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'Budget',
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
      ),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 217, 249, 0.8),
              ]),
          border: Border.symmetric(horizontal: BorderSide(color: Colors.black)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                  ),
                  elevation: 5,
                  child: ExpansionTile(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    ),
                    backgroundColor: const Color.fromRGBO(239, 226, 239, 1),
                    iconColor: const Color.fromRGBO(96, 66, 66, 1),
                    tilePadding: const EdgeInsets.all(5),
                    collapsedIconColor: const Color.fromRGBO(96, 66, 66, 1),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: expandedtitle(
                          'assets/images/icon_groom.png',
                          1210000,
                          "Groom's Budget: ",
                        ),
                      ),
                    ),
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox('assets/images/Vendor_carting.jpg', 'Catering',
                          10000),
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox('assets/images/vender_photography.jpg',
                          'Photography', 120000),
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox(
                          'assets/images/Vender_Venue.jpg', 'Venue', 150000),
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox('assets/images/vendor_Groom_wear.jpg',
                          'Groom Wear', 20000),
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox('assets/images/Vendor_invitations.jpg',
                          'Invitations', 2500),
                      const SizedBox(
                        height: 10,
                      ),
                      budgetBox('assets/images/Vendor_carting.jpg', 'Catering',
                          15000),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    ),
                    elevation: 5,
                    child: ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)),
                      ),
                      backgroundColor: const Color.fromRGBO(239, 226, 239, 1),
                      iconColor: const Color.fromRGBO(96, 66, 66, 1),
                      tilePadding: const EdgeInsets.all(5),
                      collapsedIconColor: const Color.fromRGBO(96, 66, 66, 1),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: expandedtitle(
                            'assets/images/icon_bride.png',
                            520000,
                            "Your's Budget: ",
                          ),
                        ),
                      ),
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox('assets/images/Vendor_carting.jpg',
                            'Catering', 10000),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox(
                            'assets/images/Vender_Mackup.jpg', 'Mack-up', 2000),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox('assets/images/vender_photography.jpg',
                            'Photography', 120000),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox(
                            'assets/images/Vender_Venue.jpg', 'Venue', 150000),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox('assets/images/Vendor_bridal_wear.jpg',
                            'Bridal Wear', 50000),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox('assets/images/Vendor_invitations.jpg',
                            'Invitations', 2500),
                        const SizedBox(
                          height: 10,
                        ),
                        budgetBox('assets/images/Vendor_carting.jpg',
                            'Catering', 15000),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(23, 23),
                  topLeft: Radius.elliptical(23, 23)),
              gradient: const LinearGradient(
                  begin: Alignment(6.123234262925839e-17, 1),
                  end: Alignment(-1, 6.123234262925839e-17),
                  colors: [
                    Color.fromRGBO(215, 187, 187, 1),
                    Color.fromRGBO(244, 225, 225, 1),
                  ]),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                    color: Color.fromRGBO(214, 187, 187, 1),
                    spreadRadius: 5)
              ]),
          height: 70,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  MdiIcons.plusCircleOutline,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Add Item',
                  style: TextStyle(
                    color: Color.fromRGBO(62, 53, 53, 1),
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
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(244, 225, 225, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(23, 23),
                        topRight: Radius.elliptical(23, 23))),
                child: Form(
                    child: SingleChildScrollView(
                  child: AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 23),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      blurRadius: 10.0)
                                ],
                              ),
                              width: 250,
                              margin: const EdgeInsets.all(10),
                              child: const TextField(
                                maxLines: 4,
                                minLines: 4,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black), // Your desired enabled border color
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(217, 184, 184, 1),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(23, 23))),
                                  hintText: 'Enter the vendor service',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(96, 67, 67, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Color.fromRGBO(96, 67, 67, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                _showMyDialog(context);
                              },
                              style: const ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(210, 60)),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(54, 29, 29, 1)),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(8, 8))),
                                ),
                              ),
                              child: const Text(
                                'Confirm entry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'EBGaramond',
                                  fontSize: 25,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              );
            },
          );
        },
      ),
    );
  }
}

Widget expandedtitle(String image, double number, String title) {
  final formattedPrice1 =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0)
          .format(number);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: Color.fromRGBO(96, 66, 66, 1),
          fontFamily: 'EBGaramond',
          fontSize: 18,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
      Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rupee.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Flexible(
        flex: 3,
        child: Text(
          formattedPrice1,
          style: const TextStyle(
            color: Color.fromRGBO(96, 66, 66, 1),
            fontFamily: 'EBGaramond',
            fontSize: 22,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ),
    ],
  );
}

Widget budgetBox(String imageLink, String venueName, double venuePrice) {
  final formattedPrice =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(venuePrice);

  return SizedBox(
    width: 320,
    height: 70,
    child: Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 10,
          child: Container(
            width: 310,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                )
              ],
              color: const Color.fromRGBO(221, 189, 190, 1),
              border: Border.all(
                color: const Color.fromRGBO(77, 43, 43, 1),
                width: 0.5,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        imageLink,
                      ),
                      fit: BoxFit.cover,
                      opacity: 1,
                    ),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(65, 65)),
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Color.fromRGBO(85, 32, 32, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                    children: [
                      TextSpan(
                        text: '$venueName\n',
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          height: 25,
                        ),
                      ),
                      TextSpan(
                        text: 'Estimated Amount: $formattedPrice',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Colors.black38,
        title: Center(
          child: Icon(
            MdiIcons.check,
            size: 50,
          ),
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Your Budget is successfully updated',
                style: TextStyle(
                  color: Color.fromRGBO(62, 53, 53, 1),
                  fontFamily: 'EBGaramond',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(210, 60)),
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(54, 29, 29, 1)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(8, 8))),
                  ),
                ),
                child: const Text(
                  'Back to the Budget',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'EBGaramond',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                )),
          ),
        ],
      );
    },
  );
}
