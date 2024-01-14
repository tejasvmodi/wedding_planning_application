import 'package:flutter/material.dart';

feature(String assetpath,String text,BuildContext context,Widget tej){
 return Align(      
                             child: SizedBox(
                              height: 200,
                              width: 180,
                               child: Column(
                                children: [
                                   Text(text,textAlign: TextAlign.left,
                                style: const TextStyle(
                                color: Color.fromRGBO(62, 53, 53, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 30,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w600,
                                height: 1),),
                                InkWell( 
                                                 child:  Image(image: AssetImage(assetpath),fit: BoxFit.cover,height: 150,opacity: AlwaysStoppedAnimation(1),
                                               ),onTap: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (context) => tej));
                                               },
                                               ),
                                ],
                               ),
                             ),
                          );
}