import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/getcontact.dart';
import 'package:wedding_planning_application/screen/emergency_contacts/add_emergency_contact.dart';
import 'package:wedding_planning_application/screen/emergency_contacts/components/emergency_contact_design.dart';
import 'package:wedding_planning_application/services/Contact/EmergencyContactservice.dart';
import 'package:wedding_planning_application/services/Userid/userid.dart';

class EmergencycontlistW extends StatefulWidget {
  const EmergencycontlistW({super.key});

  @override
  State<EmergencycontlistW> createState() => _EmergencycontlistWState();
}

class _EmergencycontlistWState extends State<EmergencycontlistW> {
  List<Getcontact> get = [];
  List<Getcontact> getcouple = [];
  EmergencyContactService emergency = EmergencyContactService();

String? _selectedGender;
  List<Getcouple> updatedCoupleList = [];
  String userId1 = '';


  @override
  void initState() {
    super.initState();
    someFunction();
    getcontact();
     _loadGenderFromPrefs().then((value) {
      if (updatedCoupleList.isNotEmpty) {
        log(updatedCoupleList[0].groom.toString());
        log(userId1);
        if (int.parse(updatedCoupleList[0].groom.toString()) == int.parse(userId1)) {
          getcontactcouple(
              int.parse(updatedCoupleList[0].bride.toString())); 
              log('not come here');
              log(updatedCoupleList[0].bride.toString());
        } else {
          getcontactcouple(int.parse(updatedCoupleList[0].groom.toString()));
          log('direct here ');
          log(updatedCoupleList[0].groom.toString());
        }
      } else {
        log('Wait for the seconds ');
      }
    });
  }

    Future<void> someFunction() async {
    final userId = await getUserId();
    if (userId != null) {
      userId1 = userId.toString();
      // Use the user ID for further processing
      setState(() {
        userId1;
        log(userId1);
      });
    } else {
      log('User ID not found in SharedPreferences');
    }
  }



 Future<void> _loadGenderFromPrefs() async {
    // final Getcouple? storedCouple = await getCouple();
    final Getcouple? storedCouple = await getCouple();

    if (storedCouple != null) {
      setState(() {
        updatedCoupleList = [storedCouple];
        log(storedCouple.toString());
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _selectedGender = (prefs.getString('gender') ?? 'BRIDE');
      log('No couples found in SharedPreferences.');
    }
  }
 Future<void> getcontactcouple(int id) async {
    getcouple = await emergency.getcontactservicecouple(id);
    setState(() {
      getcouple;
      log(getcouple.toString());
    });
  }

  Future<void> getcontact() async {
    get = await emergency.getcontactservice();
    setState(() {
      get;
      log(get.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        leading: IconButton(
          onPressed: () {
            Get.to(ScreenNavigation(currentIndex: 0,));                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Emergency Contacts',
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
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          gradient: const LinearGradient(
            begin: Alignment(6.123234262925839e-17, 1),
            end: Alignment(-1, 6.123234262925839e-17),
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 231, 255, 1),
              Color.fromRGBO(255, 219, 249, 1),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/icon_groom.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    'Groom',
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
                ],
              ),
              const Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
              ),
              if (get.isNotEmpty)
                for (int i = 0; i < get.length; i++)
                  EmergencyCallDesign(
                      id: get[i].contactId,
                      contactName: get[i].contactName,
                      status: get[i].status,
                      number: get[i].numbers[0],
                      alternativenumber: get[i].numbers[1]),
              if (get.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 20),
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/icon_bride.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Text(
                    'Bride',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(85, 32, 32, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 30,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  )
                ],
              ),
              const Divider(
                color: Colors.black26,
                indent: 20,
                endIndent: 20,
              ),
               if (getcouple.isNotEmpty)
                for (int i = 0; i < getcouple.length; i++)
                  EmergencyCallDesign(
                      id: getcouple[i].contactId,
                      contactName: getcouple[i].contactName,
                      status: getcouple[i].status,
                      number: getcouple[i].numbers[0],
                      alternativenumber: getcouple[i].numbers[1]),
              if (getcouple.isEmpty)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () {
            Get.to(() => const AddEmergencyContanct());

            setState(() {});
          },
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromRGBO(85, 32, 32, 1)),
              iconSize: MaterialStatePropertyAll(40)),
          color: Colors.white,
          icon: Icon(MdiIcons.plus)),
    );
  }
}
