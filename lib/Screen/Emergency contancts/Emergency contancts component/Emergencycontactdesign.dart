import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

Widget emergencycalldesign(String name, String Relation, String alternativenumber, String call) {
  return Container(
    margin: const EdgeInsets.all(8),
    height: 110,
    width: 360,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(221, 189, 190, 1),
      borderRadius: const BorderRadius.all(
        Radius.elliptical(23, 23),
      ),
      border: Border.all(
        width: 0.5,
        color: const Color.fromRGBO(85, 32, 32, 1),
      ),
      boxShadow: const [
        BoxShadow(
          blurRadius: 4,
          spreadRadius: 2,
          color: Color.fromRGBO(0, 0, 0, 0.25),
          offset: Offset(0, 2),
        )
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 252,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color.fromRGBO(67, 45, 45, 1),
                    fontFamily: 'EB Garamond',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Relation  :',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    Text(
                      Relation,
                      style: const TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Number  :',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    Text(
                      '+91 $call',
                      style: const TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Alternative Number  :',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                    Text(
                      '+91 $alternativenumber',
                      style: const TextStyle(
                        color: Color.fromRGBO(96, 67, 67, 1),
                        fontFamily: 'EB Garamond',
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber(call);
                },
                icon: const Icon(Icons.phone_enabled_outlined, size: 45),
              ),
              const Text(
                'call',
                style: TextStyle(
                  color: Color.fromRGBO(96, 67, 67, 1),
                  fontFamily: 'EB Garamond',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                  height: 1,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
