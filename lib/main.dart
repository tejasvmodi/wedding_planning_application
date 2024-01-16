import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/Profile/manageprofileFemale.dart/manageFprofile.dart';
import 'package:wedding_planning_application/Screen/Vendors/Vendor%20SIngle%20List/VendorSingleList.dart';
import 'package:wedding_planning_application/Screen/Vendors/vendorhome.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(62, 53, 53, 1),),
           
        useMaterial3: true,
      ),
      home:  const VendorSingleList(),
    );
  }
}