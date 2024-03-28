import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/components/category_bar.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/updateinspiration.dart';
import 'package:wedding_planning_application/services/profile.dart';

class ShowinspirationPhoto extends StatefulWidget {
  const ShowinspirationPhoto(
      {super.key,
      required this.index,
      required this.description,
      required this.name,
      required this.image,
      required this.tags, required this.userId});
  final int index;
  final String description;
  final String name;
  final String image;
  final String tags;
  final int userId;

  @override
  State<ShowinspirationPhoto> createState() => _ShowinspirationPhotoState();
}

class _ShowinspirationPhotoState extends State<ShowinspirationPhoto> {
 final ProfileService userinfo = Get.find();
  List<getUserName> getuser = [];


  @override
  void initState() {
    super.initState();
    fetchInspiration();
    //  log(getuser[1].userId.toString());
                    log(widget.userId.toString());
    setState(() {
      
    });

  }

 
  Future<void> fetchInspiration() async {
    getuser = await userinfo.getuserinformation(int.parse(widget.name));
    setState(() {
      getuser;
    });
  }

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
                    if (getuser.isEmpty)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (getuser.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 22, top: 10),
                        child: SizedBox(
                          child: Text(
                            "",
                            // "${getuser[0].firstName}  ${getuser[0].lastName}",
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
                    // if( widget.userId.isNaN && getuser.isNotEmpty)
                    // if( widget.userId == getuser[1].userId.toInt())
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.to(()=> Updateinspiration(index: widget.index, description: widget.description, image: widget.image, tag: widget.tags, userid:widget.userId,));
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
                          onPressed: () {},
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
