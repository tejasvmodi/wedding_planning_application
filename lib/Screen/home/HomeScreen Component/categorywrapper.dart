import 'package:flutter/material.dart';

categoryWrapper(
    String assetpath, String text, BuildContext context, Widget tej) {
  return Align(
    alignment: Alignment.topLeft,
    child: SizedBox(
      height: 125,
      width: 170,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  offset: Offset(2, 2),
                  blurRadius: 08,
                  spreadRadius: 2,
                  blurStyle: BlurStyle.solid
                ),
              ],
            ),
            child: InkWell(
              child: Image(
                image: AssetImage(assetpath),
                fit: BoxFit.cover,
                height: 100,
                alignment: Alignment.topLeft,
                opacity: const AlwaysStoppedAnimation(1),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => tej,
                    ));
              },
            ),
          ),
          const SizedBox(height: 2,),
          Text(
            text,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(62, 53, 53, 1),
                fontFamily: 'EBGaramond',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w600,
                height: 1),
          )
        ],
      ),
    ),
  );
}
