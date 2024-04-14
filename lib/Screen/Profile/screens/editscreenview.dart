import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/Screen_Navigation.dart';

import 'package:wedding_planning_application/screen/inspiration_screen/updateinspiration.dart';
import 'package:wedding_planning_application/services/core/deleteinspiration.dart';

class Editscreenview extends StatefulWidget {
  const Editscreenview(
      {super.key,
      required this.index,
      required this.description,
      required this.name,
      required this.image,
      required this.tags,
      required this.userId});
  final int index;
  final String description;
  final String name;
  final String image;
  final String tags;
  final int userId;

  @override
  State<Editscreenview> createState() => _EditscreenviewState();
}

class _EditscreenviewState extends State<Editscreenview> {
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
            const Divider(
              color: Colors.black,
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

                    // Padding(
                    //   padding: EdgeInsets.only(left: 22, top: 10),
                    //   child: SizedBox(
                    //     child: Text(
                    //       // widget.index.toString(),
                    //       //,
                    //       textAlign: TextAlign.left,
                    //       style: TextStyle(
                    //         color: Color.fromRGBO(96, 68, 68, 1),
                    //         fontFamily: 'EBGaramond',
                    //         fontSize: 25,
                    //         letterSpacing: 0,
                    //         fontWeight: FontWeight.bold,
                    //         height: 1,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 22, top: 25, right: 10),
                      child: SizedBox(
                        child: Text(
                          widget.description,
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
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(() => Updateinspiration(
                                  index: widget.index,
                                  description: widget.description,
                                  image: widget.image,
                                  tag: widget.tags,
                                  userid: widget.userId,
                                ));
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(77, 43, 43, 1),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Edit Post',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'EBGaramond',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            return deletePost(context,widget.index);
                          },
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(77, 43, 43, 1),
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Delete Post',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'EBGaramond',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ],
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

void deletePost(BuildContext context,int id ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Confirmation'),
        content:
            const Text('Are you sure you want to delete this inspiration?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
            
              return conformation(context,id);
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}

void conformation(BuildContext context,int id) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: const Text('Inspiration POst deleted Sucessfully'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
                final Deleteinspiration del = Deleteinspiration(); 
                  del.deleteinspiration(id);
            Get.to(()=>ScreenNavigation(currentIndex: 4,));
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
