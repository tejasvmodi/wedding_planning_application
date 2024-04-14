import 'package:flutter/material.dart';

groomdesign(BuildContext context,String image,String name) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$image'),
                fit: BoxFit.cover)),
      ),
       Text(name,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Color.fromRGBO(62, 53, 53, 1),
            fontFamily: 'EBGaramond',
            fontSize: 30,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            height: 1,
          ))
    ],
  );
}


groomdesign1(BuildContext context,String image,String name) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.13,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/$image'),
                fit: BoxFit.cover)),
      ),
       Text(name,
          textAlign: TextAlign.left,
          style: const TextStyle(
            color: Color.fromRGBO(62, 53, 53, 1),
            fontFamily: 'EBGaramond',
            fontSize: 30,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
            height: 1,
          ))
    ],
  );
}
