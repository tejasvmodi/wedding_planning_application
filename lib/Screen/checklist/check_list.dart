import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/screen_navigation.dart';
import 'package:wedding_planning_application/models/Checklist/getChecklist.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/services/CheckList/Checklist.dart';

class CheckListW extends StatefulWidget {
  const CheckListW({super.key});

  @override
  State<CheckListW> createState() => _CheckListWState();
}

class _CheckListWState extends State<CheckListW> {
  CheckListService checklist = Get.find();
  TextEditingController addchecklist = TextEditingController();
  bool allSelected = false;

  List<Getchecklist> getcheck = [];

  @override
  void initState() {
    super.initState();
    getchecklist();
    setState(() {});
  }

  Future<void> getchecklist() async {
    getcheck = await checklist.getCheckList();
    setState(() {
      getcheck;
      log(getcheck.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        elevation: 0,
        title: Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.17),
          child: const Text(
            'CheckList',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              allSelected ? MdiIcons.refresh : MdiIcons.check,
              size: 30,
              color: const Color.fromRGBO(62, 53, 53, 1),
            ),
          ),
        ],
      ),
      drawer: const Drawer123(),
      body: Container(
          height: double.maxFinite,
          decoration: const BoxDecoration(
            border:
                Border.symmetric(horizontal: BorderSide(color: Colors.black26)),
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 219, 249, 1),
                  Color.fromRGBO(255, 219, 249, 1),
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.03,
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.05),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/icon_bride.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const Text('Bride',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 30,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        )),
                  ],
                ),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                for (int i = 0; i < getcheck.length; i++)
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (getcheck[i].status == 'NOT_STARTED')
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                              ),
                            if (getcheck[i].status == 'STARTED')
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.hourglass_empty,
                                  size: 30,
                                ),
                              ),
                            if (getcheck[i].status == 'IN_PROGRESS')
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.hourglass_full,
                                  size: 30,
                                ),
                              ),
                            if (getcheck[i].status == 'COMPLETED')
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 30,
                                ),
                              ),
                            InkWell(
                              onTap: () {
                                updatechecklist(
                                        context, getcheck[i].checklistId)
                                    .then((value) {
                                  Future.delayed(const Duration(seconds: 1),
                                      () {
                                    setState(() {
                                      getchecklist();
                                    });
                                  });
                                });

                                log(getcheck[i].checklistId.toString());
                              },
                              child: SizedBox(
                                width: 250,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    getcheck[i].listItem.toString(),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Color.fromRGBO(62, 53, 53, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                      // decoration: TextDecoration.lineThrough,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  checklist
                                      .deleteCheckList(getcheck[i].checklistId)
                                      .then((value) {
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      setState(() {
                                        getchecklist();
                                      });
                                    });
                                  });
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                        const Divider(
                          indent: 15,
                          endIndent: 10,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.05,
                          right: MediaQuery.of(context).size.width * 0.02),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/icon_groom.png'),
                              fit: BoxFit.cover)),
                    ),
                    const Text('Groom',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 30,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        )),
                  ],
                ),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
              ],
            ),
          )),
      bottomSheet: InkWell(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black26)),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(23, 23),
                  topLeft: Radius.elliptical(23, 23)),
              gradient: LinearGradient(
                  begin: Alignment(6.123234262925839e-17, 1),
                  end: Alignment(-1, 6.123234262925839e-17),
                  colors: [
                    Color.fromRGBO(215, 187, 187, 1),
                    Color.fromRGBO(244, 225, 225, 1),
                  ]),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    blurStyle: BlurStyle.normal,
                    color: Color.fromRGBO(214, 187, 187, 1),
                    spreadRadius: 5)
              ]),
          height: MediaQuery.of(context).size.width * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Icon(
                  MdiIcons.plusCircleOutline,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Add Entry',
                  style: TextStyle(
                    color: Color.fromRGBO(62, 53, 53, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 25,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(244, 225, 225, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(23, 23),
                        topRight: Radius.elliptical(23, 23))),
                child: Form(
                    child: SingleChildScrollView(
                  child: AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 23),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      blurRadius: 10.0)
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.7,
                              margin: const EdgeInsets.all(10),
                              child: TextField(
                                controller: addchecklist,
                                maxLines: 4,
                                minLines: 4,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black), // Your desired enabled border color
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(217, 184, 184, 1),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(23, 23))),
                                  hintText: 'Browse and save Wedding dress',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(96, 67, 67, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Color.fromRGBO(96, 67, 67, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                checklist.addcheckList(
                                    addchecklist.text, 'NOT_STARTED');
                                _showMyDialog(context);
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStatePropertyAll(Size(
                                    MediaQuery.of(context).size.width * 0.50,
                                    MediaQuery.of(context).size.height * 0.07)),
                                backgroundColor: const MaterialStatePropertyAll(
                                    Color.fromRGBO(54, 29, 29, 1)),
                                shape: const MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(8, 8))),
                                ),
                              ),
                              child: const Text(
                                'Confirm entry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'EBGaramond',
                                  fontSize: 25,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              );
            },
          );
        },
      ),
    );
  }

//   Container checklistitem(String itemdetail, {bool check = false}) {
//     return
//   }
// }

  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.black38,
          title: Center(
            child: Icon(
              MdiIcons.check,
              size: 50,
            ),
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Your Checklist has been saved successfully',
                  style: TextStyle(
                    color: Color.fromRGBO(62, 53, 53, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Center(
              child: TextButton(
                  onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) {
                     return ScreenNavigation(currentIndex: 1,);
                   },));
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(
                        MediaQuery.of(context).size.width * 0.50,
                        MediaQuery.of(context).size.height * 0.07)),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(54, 29, 29, 1)),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(8, 8))),
                    ),
                  ),
                  child: const Text(
                    'Back to the checklist',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'EBGaramond',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  )),
            ),
          ],
        );
      },
    );
  }

  Future<void> updatechecklist(BuildContext context, int checklistid) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.black38,
          title: const Center(child: Text('Update Status')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      checklist.updatechecklist(checklistid, 'NOT_STARTED');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(
                          MediaQuery.of(context).size.width * 0.50,
                          MediaQuery.of(context).size.height * 0.07)),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(54, 29, 29, 1)),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Not Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      checklist.updatechecklist(checklistid, 'STARTED');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(
                          MediaQuery.of(context).size.width * 0.50,
                          MediaQuery.of(context).size.height * 0.07)),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(54, 29, 29, 1)),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.hourglass_empty,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'STARTED',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      checklist.updatechecklist(checklistid, 'IN_PROGRESS');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(
                          MediaQuery.of(context).size.width * 0.50,
                          MediaQuery.of(context).size.height * 0.07)),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(54, 29, 29, 1)),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.hourglass_full,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'IN_PROGRESS',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      checklist.updatechecklist(checklistid, 'COMPLETED');
                      setState(() {});
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(Size(
                          MediaQuery.of(context).size.width * 0.50,
                          MediaQuery.of(context).size.height * 0.07)),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(54, 29, 29, 1)),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(8, 8))),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'COMPLETED',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          // actions: <Widget>[
          //   Center(
          //     child: TextButton(
          //         onPressed: () {
          //           Navigator.pop(context);
          //         },
          // style: ButtonStyle(
          //   minimumSize: MaterialStatePropertyAll(Size(
          //       MediaQuery.of(context).size.width * 0.50,
          //       MediaQuery.of(context).size.height * 0.07)),
          //   backgroundColor:
          //       const MaterialStatePropertyAll(Color.fromRGBO(54, 29, 29, 1)),
          //   shape: const MaterialStatePropertyAll(
          //     RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.elliptical(8, 8))),
          //   ),
          // ),
          //         child: const Text(
          //           'Update Status',
          // style: TextStyle(
          //   color: Colors.white,
          //   fontFamily: 'EBGaramond',
          //   fontSize: 18,
          //   letterSpacing: 0,
          //   fontWeight: FontWeight.bold,
          //   height: 1,
          // ),
          // //         )),
          //   ),
          // ],
        );
      },
    );
  }
}
