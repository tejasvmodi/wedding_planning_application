import 'package:flutter/material.dart';
import 'package:wedding_planning_application/Screen/Profile/Profile%20Component/profilephoto.dart';

class ManageFprofile extends StatefulWidget {
  const ManageFprofile({super.key});

  @override
  State<ManageFprofile> createState() => _ManageFprofileState();
}

class _ManageFprofileState extends State<ManageFprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 190, 221),
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
            padding: EdgeInsets.only(left: 35),
            child: Text(
              'Manage Profile',
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
          elevation: 0,
          actions: const [

            InkWell(
              child: Image(image: AssetImage('assets/images/icon_groom.png',),height: 40,),
            ),
            SizedBox(width: 5,)
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              profilephoto('Anjali','assets/images/Account Icon.jpg'),
              Container(
                width: 360,
                height: 60,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        width: 360,
                        height: 60,
                        decoration:  BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10)
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                            )
                          ],
                          color: const Color.fromRGBO(245, 201, 238, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(77, 43, 43, 1),
                            width: 0.5,
                            
                          )
                        ),
                      ))
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}