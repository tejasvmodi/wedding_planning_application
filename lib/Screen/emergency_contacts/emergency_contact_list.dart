import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/Emergency%20Contanct/getcontact.dart';
import 'package:wedding_planning_application/screen/emergency_contacts/add_emergency_contact.dart';
import 'package:wedding_planning_application/screen/emergency_contacts/components/emergency_contact_design.dart';
import 'package:wedding_planning_application/services/Contact/EmergencyContactservice.dart';

class EmergencycontlistW extends StatefulWidget {
  const EmergencycontlistW({super.key});

  @override
  State<EmergencycontlistW> createState() => _EmergencycontlistWState();
}

class _EmergencycontlistWState extends State<EmergencycontlistW> {
  List<Getcontact> get = [];
  EmergencyContactService emergency = EmergencyContactService();
  @override
  void initState() {
    super.initState();
    getcontact();
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
            Navigator.pop(context);
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
                EmergencyCallDesign(id: get[i].contactId, contactName: get[i].contactName, status: get[i].status, number: get[i].numbers[0], alternativenumber:get[i].numbers[1]),
                
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
