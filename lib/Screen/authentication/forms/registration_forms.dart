import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Add this import
import 'package:wedding_planning_application/screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/services/authentication/auth_service.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final AuthenticationService authService = Get.find();
  String _selectedGender = 'BRIDE';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/Wedding Planner Transparent.png'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //TextField Started
            Material(
              color: Colors.transparent,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.02,
                      MediaQuery.of(context).size.width * 0.03,
                      0,
                      0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: firstName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'First Name',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(62, 53, 53, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 23,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 8), // Add spacing between text fields
                        Expanded(
                          child: TextField(
                            controller: lastName,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelText: 'Last Name',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(62, 53, 53, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 23,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.03,
                        0,
                        0),
                    child: TextField(
                      controller: email,
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
                                fontWeight: FontWeight.bold,
                                height: 1),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.03,
                        0,
                        0),
                    child: TextField(
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
                                fontWeight: FontWeight.bold,
                                height: 1),
                          )),
                    ),
                  ),

                  //TextField Ended
                  // Radio Button Started

                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.width * 0.01, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            leading: Radio<String>(
                              activeColor: const Color.fromRGBO(54, 29, 29, 1),
                              value: 'BRIDE',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                  _saveGenderToPrefs(value);
                                });
                              },
                            ),
                            title: const Text('Bride',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(62, 53, 53, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 23,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1)),
                          ),
                        ),
                        // Add spacing between options
                        Expanded(
                          child: ListTile(
                            leading: Radio<String>(
                              activeColor: const Color.fromRGBO(54, 29, 29, 1),
                              value: 'GROOM',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                  _saveGenderToPrefs(value);
                                });
                              },
                            ),
                            title: const Text('Groom',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color.fromRGBO(54, 29, 29, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 23,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Radio Button Ended
                  //Buttons Started
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.02,
                        MediaQuery.of(context).size.width * 0.03,
                        0,
                        0),
                    child: ElevatedButton(
                      onPressed: () {
                        authService.registerUser(firstName.text, lastName.text,
                            email.text, password.text, _selectedGender);
                        setState(() {});
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
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: 'EBGaramond',
                            fontSize: 23,
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
                        MediaQuery.of(context).size.width * 0.03,
                        0,
                        0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginForm(),
                            ));
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
                        'Sign In',
                        style: TextStyle(
                            fontFamily: 'EBGaramond',
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0,
                            color: Color.fromRGBO(77, 43, 43, 1),
                            height: 1),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _saveGenderToPrefs(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
  }
}
