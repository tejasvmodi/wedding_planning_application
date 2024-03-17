import 'package:flutter/material.dart';

bookitem(
    String imageLink,
    String venuename,
    BuildContext context,
    Widget redirectp,
    String venueprovide,
    String vendorname,
    int originalprice,
    int discountprice,
    int finalprice) {
  return InkWell(
    child: SizedBox(
      width: 400,
      height: 140,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 10,
            child: Container(
              width: 360,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
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
                  )),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            imageLink,
                          ),
                          fit: BoxFit.cover,
                          opacity: 1),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(65, 65)),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
                              text: '$venuename\n',
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 25),
                            ),
                            TextSpan(
                              text: '$venueprovide By $vendorname',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          'Original Amount :               ₹$originalprice',
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          'Vendor Discount  :               ₹$discountprice',
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: Text(
                          'Payable Amount   :               ₹$finalprice',
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => redirectp,
          ));
    },
  );
}
