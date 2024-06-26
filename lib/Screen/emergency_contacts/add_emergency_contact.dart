import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/getrelation.dart';
import 'package:wedding_planning_application/services/Contact/EmergencyContactservice.dart';
class AddEmergencyContanct extends StatefulWidget {
  const AddEmergencyContanct({super.key});

  @override
  State<AddEmergencyContanct> createState() => _AddEmergencyContanctState();
}

class _AddEmergencyContanctState extends State<AddEmergencyContanct> {
  String? selectedRelationship;
  List<String> emergencyContanct = [];
  TextEditingController name = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController alternativenumber = TextEditingController();
  EmergencyContactService service =EmergencyContactService();
  List<Relation> relations =[];
  @override
  void initState() {
    super.initState();
    getrelationship();
  }

  Future<void> getrelationship() async{
    relations = await service.getrelation();
    setState(() {
      relations;
      log(relations.toString());
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(),
          child: Text(
            'Add Emergency Contact',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: 25,
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
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/icon_emergency-call.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
                width: 340,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.elliptical(23, 34)),
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
                      child:  TextField(
                        controller: name,
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Name',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        // controller: TextEditingController(text:),
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
                      child:  TextField(
                        keyboardType: TextInputType.number,
                        controller:  phonenumber,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Phone  Number',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        // controller: TextEditingController(text:),
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
                        keyboardType: TextInputType.number,
                        controller: alternativenumber,
                        maxLines: 1,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Alternative Phone Number',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        // controller: TextEditingController(text:),
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
                      child: DropDownWidget(
                        onRelationShipSelected: (value) {
                          setState(() {
                            selectedRelationship = value;
                            
                          });
                          log(selectedRelationship.toString());
                        }, relations: relations,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: TextButton(
                          onPressed: () {
                           emergencyContanct.add(phonenumber.text);
                           emergencyContanct.add(alternativenumber.text);
                           EmergencyContactService emergency = EmergencyContactService();
                           log(name.text);
                           log(emergencyContanct.toString());
                           log(selectedRelationship.toString());
                           emergency.addEmergencyService(name.text, emergencyContanct,selectedRelationship!);
                           
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(77, 43, 43, 1)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(55),
                              )),
                              shadowColor: MaterialStateProperty.all(Colors.grey)),
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
class DropDownWidget extends StatefulWidget {
  final List<Relation> relations;
  final Function(String)? onRelationShipSelected;

  const DropDownWidget({
    super.key,
    required this.relations,
    this.onRelationShipSelected,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            hint: const Text(
              'Select Relationship',
              style: TextStyle(
                color: Color.fromRGBO(85, 32, 32, 1),
                fontFamily: 'EBGaramond',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            value: selectedValue,
            items: widget.relations
                .map(
                  (relation) => DropdownMenuItem<String>(
                    value: relation.relationshipName,
                    child: Text(
                      relation.relationshipName,
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                widget.onRelationShipSelected!(value!);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select the Relationship.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
