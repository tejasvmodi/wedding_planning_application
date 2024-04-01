import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

profiledetails(String textlabel,String hinttext){
  return  SizedBox(
              width: 370,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 370,
                      height: 60,
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
                          color: const Color.fromRGBO(245, 201, 238, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(77, 43, 43, 1),
                            width: 0.5,
                          )),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                           Text(
                            '$textlabel :',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                           Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 4,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: hinttext,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        
                          IconButton(
                            onPressed: () {},
                            icon: Icon(MdiIcons
                                .pencilOutline), // Use MdiIcons, not MdiIcons
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
        
}