import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/components/category_bar.dart';

class ShowinspirationPhoto extends StatefulWidget {
   ShowinspirationPhoto({super.key, required this.index, required this.description, required this.name, required this.image});
  final int index;
  final String description;
  final String name;
  final String image;


  @override
  State<ShowinspirationPhoto> createState() => _ShowinspirationPhotoState();
}

class _ShowinspirationPhotoState extends State<ShowinspirationPhoto> {

    
  @override
 

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
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
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Inspiration ',
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
              MdiIcons.bookmarkOutline,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 217, 249, 1)
              ]),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
              child: CategoryBar(categories: [
                'Dress',
                'Rustic Theme',
                'Red Wedding Dress',
                'Decoration',
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 22.0, top: 10, bottom: 10, right: 22),
                      child: Container(
                        height: 600,
                        width: 340,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                              image: NetworkImage(widget.image),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 22, top: 10),
                      child: SizedBox(
                        child: Text(
                        widget.name,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Color.fromRGBO(96, 68, 68, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 25,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(left: 22, top: 25, right: 10),
                      child: SizedBox(
                        child: Text(
                       widget.description ,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            color: Color.fromRGBO(96, 68, 68, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 16,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
  
    );
  }
}
