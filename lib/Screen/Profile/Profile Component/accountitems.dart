import 'package:flutter/material.dart';
import 'package:get/get.dart';


accountitem(String text,IconData iconname,BuildContext context,Widget find){
  return Row(
            children: [
              const SizedBox(width: 25,),
              Icon(iconname ,size: 45,color: const Color.fromRGBO(68, 45, 45, 1),),
               const SizedBox(width: 25,),
               InkWell(child:   Text( text, textAlign: TextAlign.left,
                style: const TextStyle(
                    color: Color.fromRGBO(68, 45, 45, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 26,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                    height: 1)),
                    onTap: () {
                     Get.to(()=>find);
                    },),
                   
            ],
          );
}