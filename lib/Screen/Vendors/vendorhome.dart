import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class vendorhome extends StatefulWidget {
  const vendorhome({super.key});

  @override
  State<vendorhome> createState() => _vendorhomeState();
}

class _vendorhomeState extends State<vendorhome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          padding: EdgeInsets.only(left: 75),
          child: Text(
            'Vendors',
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
        actions:  [
          IconButton(onPressed: () {
            
          }, icon: Icon(MdiIcons.heartOutline,size: 40,)),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
           decoration: const BoxDecoration(color: Color.fromRGBO(255, 217, 249, 1),),
          child: Column(children: [
              SizedBox(
              
                height: 60,
                  child: Container(
                     decoration:  BoxDecoration(
                    color: const Color.fromRGBO(255, 217, 249, 1),
                    border : Border.all(
            color: const Color.fromRGBO(111, 80, 80, 1),
            width: 1,
          ),
                  ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(MdiIcons.tuneVertical,size: 45,)),
                      IconButton(onPressed: () {
                          
                        }, icon: const Icon(Icons.search,size: 45,)),
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(MdiIcons.bookmarkOutline,size: 45,)),
                      ],
                                  ),
                  ),

              ),
              const SizedBox(height: 25),
               SizedBox(
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
                          color:  const Color.fromRGBO(239, 226, 226, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(77, 43, 43, 1),
                            width: 0.5,
                          )),
                      child:  Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              // image: DecorationImage(image: 
                              // )
                            ),
                          )
                          
                           
                    
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ]),
        )),
    );
  }
}