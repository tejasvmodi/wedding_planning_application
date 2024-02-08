import 'package:flutter/material.dart';
import 'package:get/get.dart';

VendorBox(String Imagelink,String venuename,String venueprovide,Widget redirectp,BuildContext context){
  return InkWell(
                child: SizedBox(
                  width: 370,
                  height: 100,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 10,
                        child: Container(
                          width: 350,
                          height: 100,
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
                                       Imagelink,
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
                              RichText(
                                text:  TextSpan(
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
                                      child: SizedBox(
                                          height:
                                              25), 
                                    ),
                                    TextSpan(
                                      text:
                                        venueprovide,
                                             style: const TextStyle(
                                        fontSize:
                                            14, 
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
                ),
              onTap: () {
                Get.to(redirectp);
              },
              );
}