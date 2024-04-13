import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/screen/profile/screens/manage_profile_groom.dart';
import 'package:wedding_planning_application/services/Couple/couple.dart';

class AddCouple extends StatefulWidget {
  const AddCouple({super.key, required this.userid});
  final String userid;

  @override
  State<AddCouple> createState() => _AddCoupleState();
}

class _AddCoupleState extends State<AddCouple> {
  TextEditingController firstname= TextEditingController();
  TextEditingController lastname= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController password = TextEditingController();
  String _selectedGender = 'BRIDE';
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
                height: 60,
                width: double.infinity,
              ),
          
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 450,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius:
                        const BorderRadius.all(Radius.elliptical(23, 34)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, color: Colors.transparent)
                    ]),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(23, 23)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                          )
                        ],
                        color: Color.fromRGBO(245, 201, 238, 1),
                      ),
                      child:  TextField(
                        controller: firstname,
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'First Name',
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
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(23, 23)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                          )
                        ],
                        color: Color.fromRGBO(245, 201, 238, 1),
                      ),
                      child:  TextField(
                        // keyboardType: TextInputType.number,
                        controller:  lastname,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Last Name',
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
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(23, 23)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 1),
                            blurRadius: 4,
                          )
                        ],
                        color: Color.fromRGBO(245, 201, 238, 1),
                      ),
                       child:  TextField(
                        // keyboardType: TextInputType.number,
                        controller: email ,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Email',
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
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(23, 23)),
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
                        // keyboardType: TextInputType.number,
                        controller: password ,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'password',
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                activeColor:
                                    const Color.fromRGBO(54, 29, 29, 1),
                                value: 'BRIDE',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Bride',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(62, 53, 53, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1)),
                            ),
                          ),
                          // Add spacing between options
                          Expanded(
                            child: ListTile(
                              leading: Radio<String>(
                                activeColor:
                                    const Color.fromRGBO(54, 29, 29, 1),
                                value: 'GROOM',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value!;
                                  });
                                },
                              ),
                              title: const Text('Groom',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(54, 29, 29, 1),
                                      fontFamily: 'EBGaramond',
                                      fontSize: 20,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: TextButton(
                          onPressed: () {
                            log(firstname.text.toString());
                            log(lastname.text.toString());
                            log(email.text.toString());
                            log(password.text.toString());
                            log(_selectedGender.toString());
                            log(widget.userid.toString());
                            Coupleservice couple = Coupleservice();
                            couple.addcouple(firstname.text, lastname.text, email.text, password.text, _selectedGender, widget.userid).then((value) {
                              Future.delayed( Duration(seconds: 1),(){
                                Get.to(()=>  ManageMprofile(userid: int.parse(widget.userid),));
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
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
