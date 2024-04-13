import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/Screen/Profile/screens/manage_profile_groom.dart';
import 'package:wedding_planning_application/repository/Couple/getcouplewithemail.dart';

class Fetchemail extends StatefulWidget {
  const Fetchemail({super.key, required this.userid});
  final int userid;
  @override
  State<Fetchemail> createState() => _FetchemailState();
}

class _FetchemailState extends State<Fetchemail> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 219, 249, 1),
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
          padding: EdgeInsets.only(left: 50),
          child: Text(
            'Add Couple',
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
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
            color: Color.fromRGBO(111, 80, 80, 1),
          )),
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 231, 255, 1),
                Color.fromRGBO(255, 219, 249, 1),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 210,
              ),
              Container(
                height: 200,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(23, 34)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, color: Colors.transparent)
                    ]),
                child: Column(children: [
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(
                    'Connect With Existing User',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(130, 52, 52, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 25,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(23, 23)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                        )
                      ],
                      color: Color.fromRGBO(245, 201, 238, 1),
                    ),
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Enter the Email Id',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      style: const TextStyle(
                          color: Color.fromRGBO(85, 32, 32, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextButton(
                        onPressed: () {
                          log(email.text.toString());
                          Addcouplerepowithemil emailcouple = Addcouplerepowithemil();
                          emailcouple.addcouple(email.text).then((value) {
                            Future.delayed(const Duration(seconds: 2),(){
                              Get.to(()=>ManageMprofile(userid: widget.userid));
                            });
                          });

                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromRGBO(77, 43, 43, 1)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            )),
                            shadowColor:
                                MaterialStateProperty.all(Colors.grey)),
                        child: const Text(
                          'Submit',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'EBGaramond',
                              fontSize: 23,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1),
                        )),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
