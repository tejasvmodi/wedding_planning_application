import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

// ignore: camel_case_types
class registeration_form extends StatefulWidget {
  const registeration_form({super.key});

  @override
  State<registeration_form> createState() => _registeration_formState();
}

// ignore: camel_case_types
class _registeration_formState extends State<registeration_form> {
  String _selectedGender = 'Bride';

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

          //TextField Started
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
                          'Name',
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
                              fontWeight: FontWeight.bold,
                              height: 1),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: Radio<String>(
                            activeColor: const Color.fromRGBO(54, 29, 29, 1),
                            value: 'Bride',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
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
                            value: 'Groom',
                            groupValue: _selectedGender,
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
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
                  padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
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
                  padding: const EdgeInsets.fromLTRB(9, 10, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Login_form(),));
                         
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(color: Color.fromRGBO(67, 45, 45, 1)),
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
                          color:Color.fromRGBO(77, 43, 43, 1),
                          height: 1),
                    )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
