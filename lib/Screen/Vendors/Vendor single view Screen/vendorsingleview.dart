import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class vendorsingleview extends StatefulWidget {
  const vendorsingleview({super.key});

  @override
  State<vendorsingleview> createState() => _vendorsingleviewState();
}

class _vendorsingleviewState extends State<vendorsingleview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.only(left: 80),
          child: Text(
            'Venues',
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                MdiIcons.heartOutline,
                size: 40,
              )),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 231, 255, 1),
                Color.fromRGBO(255, 219, 249, 1),
              ]),
        ),
        child:Column(
          children: [
              SizedBox(
              height: 60,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 217, 249, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(111, 80, 80, 1),
                    width: 1,
                  ),
                ),
            child: Row(
             crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MdiIcons.tuneVertical,
                              size: 45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              size: 45,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              MdiIcons.bookmarkOutline,
                              size: 45,
                            )),
                      ],
            ),
              )
              ),
          const SizedBox(height: 30,),
          Container(
           alignment: Alignment.topLeft,
            child: const Text(
                        '   ITC Grand, Goa',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(62, 53, 53, 1),
                            fontFamily: 'EBGaramond',
                            fontSize:30 ,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
          ),
          SizedBox(height: 50,),
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/Vendor_Single_View_1.jpg'))
            ),)
          ],
        )
      ),
    );
  }
}