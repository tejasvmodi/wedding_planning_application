import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Profile/Profile%20Component/accountitems.dart';
import 'package:wedding_planning_application/Screen/Profile/Profile%20Component/profilephoto.dart';
import 'package:wedding_planning_application/Screen/authentication/forms/login_form.dart';

class ProfileW extends StatefulWidget {
  const ProfileW({super.key});

  @override
  State<ProfileW> createState() => _ProfileWState();
}

class _ProfileWState extends State<ProfileW> {
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
            padding: EdgeInsets.only(left: 70),
            child: Text(
              'Account',
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
            IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.googleTranslate,
                  size: 45,
                  color: const Color.fromRGBO(85, 32, 32, 1),
                ))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
             
              profilephoto('Anjali','assets/images/Account Icon.jpg'),
              accountitem('My Booking', MdiIcons.listBoxOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Manage Profile', MdiIcons.listBoxOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Recommendation', MdiIcons.thumbUpOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Location', Icons.location_on_outlined, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Chats', MdiIcons.messageOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Contanct Support', MdiIcons.phoneOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Write a Review', MdiIcons.pencilOutline, context,
                  const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem(
                  'Log In/Out', MdiIcons.login, context, const Login_form()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
            ],
          ),
        ));
  }
}
