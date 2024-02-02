import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Drawer123 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        width: 240,
        shape: const ContinuousRectangleBorder(
            borderRadius:
                BorderRadius.horizontal(right: Radius.elliptical(150, 50)) ),
        backgroundColor: const Color.fromRGBO(255, 225, 255, 1),
          
        child: ListView(
          children: [
            SizedBox(
              height: 70,
              child: DrawerHeader(
                  child: Row(
                children: [
                  Center(
                    heightFactor: 50,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Text(
                      'Menu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 30,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                  ),
                ],
              )),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 15),
              child: Row(
                children: [
                  Icon(
                    MdiIcons.storeOutline,
                    size: 35,
                    color: const Color.fromRGBO(62, 53, 53, 1),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    child: const Text(
                      'Vendor',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 24,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 23,
              endIndent: 34,
              color: Color.fromRGBO(105, 96, 96, 1),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.bellOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Notification',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.walletOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                        // shadows: [const Shadow(blurRadius: 4)],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Budget',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.messageTextOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Chat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 15,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.listBoxOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'CheckList',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.accountOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Row(
                    children: [
                      Icon(
                        MdiIcons.helpCircleOutline,
                        size: 35,
                        color: const Color.fromRGBO(62, 53, 53, 1),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      InkWell(
                        child: const Text(
                          'Help',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const Divider(
                  indent: 23,
                  endIndent: 34,
                  color: Color.fromRGBO(105, 96, 96, 1),
                ),
              ],
            ),
          ],
        ));
  }
}
