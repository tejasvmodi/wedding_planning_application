import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/forgotpassword_form.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/registration_forms.dart';
import 'package:wedding_planning_application/Screen/home/home.dart';

class Login_form extends StatefulWidget {
  const Login_form({super.key});

  @override
  State<Login_form> createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      'assets/images/Wedding Planner Transparent.png'),
                  fit: BoxFit.fitWidth),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Material(
            color: Colors.transparent,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(9, 10, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(9, 20, 0, 0),
                  child: TextField(
                    decoration: InputDecoration(
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
                  padding: const EdgeInsets.fromLTRB(9, 25, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {

                      Get.to(home());
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
                  padding: const EdgeInsets.fromLTRB(9, 14, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                       Get.to(registeration_form());
                         
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                          color: Color.fromRGBO(67, 45, 45, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
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
                  padding: const EdgeInsets.fromLTRB(9, 14, 0, 0),
                  child: InkWell(
                    child: const Text('Forgot Password ?', style: TextStyle(
                          fontFamily: 'EBGaramond',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 0,
                          color: Color.fromRGBO(77, 43, 43, 1),
                          height: 1),
                          
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPassword(),));
                          },
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
