import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wedding_planning_application/Screen/Screen_Navigation.dart';

void main() {
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
           
        useMaterial3: true,
      ),
      home:  const Screen_Navigation
      (),
    );
  }
}