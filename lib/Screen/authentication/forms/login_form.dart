import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/screen/authentication/forms/forgotpassword_form.dart';
import 'package:wedding_planning_application/screen/authentication/forms/registration_forms.dart';
import 'package:wedding_planning_application/services/authentication/auth_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthenticationService authService =AuthenticationService();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 235, 255, 1),
                  Color.fromRGBO(255, 235, 255, 1),
                ]),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.04,
            vertical: MediaQuery.of(context).size.height * 0.04,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Wedding Planner Transparent.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.03,
                          0,
                          0),
                      child: TextField(
                        controller: username,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            label: Text(
                              'Email',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(62, 53, 53, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 23,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  height: 1),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          0),
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            label: Text(
                              'Password',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color.fromRGBO(62, 53, 53, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 23,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w400,
                                  height: 1),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          0),
                      child: ElevatedButton(
                        onPressed: () {
                          
                          authService.loginWithUsernameAndPassword(
                              username.text, password.text);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor: const Color.fromRGBO(77, 43, 43, 1),
                          fixedSize: const Size(500, 60),
                        ),
                        child: const Center(
                            child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontFamily: 'EBGaramond',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              height: 1),
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.02,
                          MediaQuery.of(context).size.width * 0.05,
                          0,
                          0),
                      child: ElevatedButton(
                        onPressed: () async {
                          Get.to(() => const RegistrationForm());
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              color: Color.fromRGBO(67, 45, 45, 1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          fixedSize: const Size(500, 60),
                        ),
                        child: const Center(
                            child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontFamily: 'EBGaramond',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                              color: Color.fromRGBO(77, 43, 43, 1),
                              height: 1),
                        )),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.02,
                            MediaQuery.of(context).size.width * 0.05,
                            0,
                            0),
                        child: InkWell(
                          child: const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                fontFamily: 'EBGaramond',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                letterSpacing: 0,
                                color: Color.fromRGBO(77, 43, 43, 1),
                                height: 1),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ));
                          },
                        ))
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
