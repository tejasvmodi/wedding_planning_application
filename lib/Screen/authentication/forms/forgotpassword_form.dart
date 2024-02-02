import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color.fromRGBO(255, 225, 255, 1),
        
       leading:IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Login_form(),));
                         
         }, icon: const Icon(Icons.arrow_back))
      

      ),
      body: Container( decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 2),
              end: Alignment(-2, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 225, 255, 1),
              ]),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
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
                   Padding(
                    padding: const EdgeInsets.fromLTRB(9, 25, 0, 0),
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
                        'Send Recovery Link',
                        style: TextStyle(
                            fontFamily: 'EBGaramond',
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 0,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            height: 1),
                      )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        ),
    );
  }
}