import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/profile/components/profile_details.dart';
import 'package:wedding_planning_application/screen/profile/components/profile_photo.dart';
import 'package:wedding_planning_application/screen/profile/screens/manage_profile_groom.dart';

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
        actions: [
          InkWell(
            child: const Image(
              image: AssetImage(
                'assets/images/icon_groom.png',
              ),
              height: 40,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageMprofile(),
                  ));
            },
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            profilephoto('Anjali', 'assets/images/Account Icon.jpg'),
            SizedBox(
              width: 370,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
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
                          )),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'First Name :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: "Anjali",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            '|   ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(125, 122, 112, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 22,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                          const Text(
                            'Last Name :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 4,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Joshi',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(MdiIcons
                                .pencilOutline), // Use MdiIcons, not MdiIcons
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            profiledetails('Email', 'anjali123@gmail.com'),
            const SizedBox(
              height: 25,
            ),
            profiledetails('Phone', '+91 81000 92000'),
            const SizedBox(
              height: 25,
            ),
            profiledetails(
                'Address', '102, Anand Bag Socity , near bob tower '),
            const SizedBox(
              height: 25,
            ),
            profiledetails('City', 'Ahmadabad'),
            const SizedBox(
              height: 25,
            ),
            profiledetails('Area', 'Navrangpura , 38006'),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 370,
              height: 60,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              offset: Offset(0, 1),
                              blurRadius: 4,
                            )
                          ],
                          color: const Color.fromRGBO(239, 226, 226, 1),
                          border: Border.all(
                            color: const Color.fromRGBO(77, 43, 43, 1),
                            width: 0.5,
                          )),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Logged In as  :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              '   Bride',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(85, 32, 32, 1),
                                fontFamily: 'EBGaramond',
                                fontSize: 15,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(MdiIcons
                                .pencilOutline), // Use MdiIcons, not MdiIcons
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
