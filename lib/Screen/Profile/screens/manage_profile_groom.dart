import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/models/getUsername.dart';
import 'package:wedding_planning_application/screen/profile/components/profile_photo.dart';
import 'package:wedding_planning_application/screen/profile/components/profileitemgroom.dart';
import 'package:wedding_planning_application/screen/profile/screens/manage_profile_bride.dart';
import 'package:wedding_planning_application/services/Couple/couple.dart';
import 'package:wedding_planning_application/services/profile.dart';

class ManageMprofile extends StatefulWidget {
  const ManageMprofile({super.key, required this.userid});
  final int userid;
  @override
  State<ManageMprofile> createState() => _ManageMprofileState();
}

class _ManageMprofileState extends State<ManageMprofile> {

  ProfileService profile = ProfileService();
  Coupleservice couple = Coupleservice();
  List<Getcouple> getcouple = [];
  List<getUserName> getcoupleinfo = [];

  @override
  void initState() {
    super.initState();
    getcoupledata().then((value) {
      log(getcouple.toString());
      if (getcouple.isNotEmpty) {
        // ignore: unrelated_type_equality_checks
        if (int.parse(getcouple[0].bride.toString()) == widget.userid) {
          getcoupleinformation(int.parse(getcouple[0].groom.toString()));
        } else {
          getcoupleinformation(int.parse(getcouple[0].bride.toString()));
        }
      }
    });
  }

  Future<void> getcoupleinformation(int id) async {
    try {
      getcoupleinfo = await profile.getuserinformation(id);
      setState(() {
        log(getcoupleinfo.toString());
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> removecouple() async {
    await deleteCouple();
  }

  Future<void> getcoupledata() async {
    // Fetch couples from service
    final List<Getcouple> newCouples = await couple.getcoupleservice();

    // Retrieve currently stored couple
    final Getcouple? storedCouple = await getCouple();

    // Check if the fetched couple is not null and is different from the stored couple
    if (newCouples.isNotEmpty &&
        (storedCouple == null || !newCouples.contains(storedCouple))) {
      // Save the new couple
      await saveCouple(newCouples.first);

      // Update the state
      setState(() {
        getcouple = newCouples;
      });
    } else {
      if (storedCouple != null) {
        // Couple already exists in SharedPreferences
        log('Couple Already exists: $storedCouple');
        // Update the state with the stored couple
        setState(() {
          getcouple = [storedCouple]; // Assigning a list with the stored couple
        });
      } else {
        log('No couples fetched from the service.');
      }
    }
  }

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
                  'assets/images/icon_bride.png',
                ),
                height: 40,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ManageFprofile(),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: getcouple.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (getcoupleinfo.isNotEmpty)
                      profilephoto(
                        "${getcoupleinfo[0].firstName} ${getcoupleinfo[0].lastName}",
                        getcoupleinfo[0].avatar.url,
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
                                  topLeft: Radius.circular(10),
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
                                ),
                              ),
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
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(
                                          getcoupleinfo.isNotEmpty
                                              ? getcoupleinfo[0]
                                                  .firstName
                                                  .toString()
                                              : '',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 15,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    '| ',
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
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Text(
                                          getcoupleinfo.isNotEmpty
                                              ? getcoupleinfo[0]
                                                  .lastName
                                                  .toString()
                                              : '',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color:
                                                Color.fromRGBO(85, 32, 32, 1),
                                            fontFamily: 'EBGaramond',
                                            fontSize: 15,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty)
                      profiledetailsq(
                        'Email',
                        getcoupleinfo[0].email.toString(),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty)
                      profiledetailsq(
                        'Phone',
                        getcoupleinfo[0].phone.toString(),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty &&
                        getcoupleinfo[0].addressInfo != null)
                      profiledetailsq(
                        'Address line 1',
                        getcoupleinfo[0].addressInfo!.addressLine1.toString(),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty &&
                        getcoupleinfo[0].addressInfo != null)
                      profiledetailsq(
                        'Address line 2',
                        getcoupleinfo[0].addressInfo!.addressLine2.toString(),
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty &&
                        getcoupleinfo[0].addressInfo == null)
                      profiledetailsq(
                        'Address line 1',
                        'enter the Address ',
                      ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (getcoupleinfo.isNotEmpty &&
                        getcoupleinfo[0].addressInfo == null)
                      profiledetailsq(
                        'Address line 2',
                        'enter the Address ',
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
                                  topLeft: Radius.circular(10),
                                ),
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
                                ),
                              ),
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
                                  if (getcouple.isNotEmpty)
                                    Expanded(
                                      child: int.parse(getcouple[0].bride.toString()) ==
                                              widget.userid
                                          ? const Text(
                                              'bride',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    85, 32, 32, 1),
                                                fontFamily: 'EBGaramond',
                                                fontSize: 15,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1,
                                              ),
                                            )
                                          : const Text(
                                              'Groom',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color.fromRGBO(
                                                    85, 32, 32, 1),
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
                                    icon: const Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              )
            : const Center(
                heightFactor: 1,
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      'Loading ......',
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
                  ],
                ),
              ));
  }
}
