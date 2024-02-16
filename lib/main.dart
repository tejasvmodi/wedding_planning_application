import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';


void main() {
  //   SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   // DeviceOrientation.portraitDown,
  //   // DeviceOrientation.landscapeLeft,
  //   // DeviceOrientation.landscapeRight,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

       
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor:const Color.fromRGBO(62, 53, 53, 1),),
    //      inputDecorationTheme: const InputDecorationTheme(
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.black), // Your desired enabled border color
    // ),
    //  disabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(color: Colors.black), // Your desired disabled border color
    // ),),
        useMaterial3: true,
      ),
      home: Screen_Navigation
      (),
    );
  }
}