import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/forgotpassword_form.dart';
import 'package:wedding_planning_application/Screen/components/OnboardingScreen.dart';
import 'package:wedding_planning_application/Screen/home/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const home(),
    );
  }
}