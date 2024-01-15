import 'package:flutter/material.dart';

profilephoto(String name,String image) {
  return SizedBox(
    width: 400,
    height: 370,
    child: Stack(children: <Widget>[
      Container(
        width: 500,
        height: 265,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(0, 123234262925839e-17),
              colors: [
                Color.fromRGBO(177, 83, 159, 1),
                 Color.fromRGBO(255, 217, 247, 0.6)
              ]),
        ),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(177, 73, 129, 0.25),
                blurRadius: 10,
                spreadRadius: 3,
                blurStyle: BlurStyle.inner)
          ]),
        ),
      ),
      Positioned(
        top: 120,
        left: 92,
        child: Container(
          width: 195,
          height: 195,
          decoration:  BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                  offset: Offset(0, 4),
                  blurRadius: 3,
                  spreadRadius: 1)
            ],
            image: DecorationImage(
              opacity: 1,scale: 12,
                image: AssetImage(image),
                fit: BoxFit.fitWidth),
            borderRadius: const BorderRadius.all(Radius.elliptical(195, 195)),
          ),
        ),
      ),
       Padding(
        padding: const EdgeInsets.only(top: 325, left: 155),
        child: SizedBox(
          height: 50,
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Color.fromRGBO(85, 32, 32, 1),
                fontFamily: 'EBGaramond',
                fontSize: 26,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
      ),
    ]),
  );
}
