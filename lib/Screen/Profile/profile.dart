import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/Screen/Booking/WishList/Wishlist.dart';
import 'package:wedding_planning_application/Screen/emergency_contacts/emergency_contact_list.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/screen/authentication/forms/login_form.dart';
import 'package:wedding_planning_application/screen/booking/my_bookings/show_bookings.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
// import 'package:wedding_planning_application/screen/other_screens/review.dart';
// import 'package:wedding_planning_application/screen/other_screens/support.dart';
import 'package:wedding_planning_application/screen/profile/components/account_items.dart';
import 'package:wedding_planning_application/screen/profile/components/profile_photo.dart';
import 'package:wedding_planning_application/screen/profile/screens/editpost.dart';
import 'package:wedding_planning_application/screen/profile/screens/manage_profile_bride.dart';
import 'package:wedding_planning_application/services/Address/addressService.dart';
import 'package:wedding_planning_application/services/Inspiration/insapiration_service.dart';
import 'package:wedding_planning_application/services/authentication/auth_service.dart';
import 'package:wedding_planning_application/services/profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthenticationService authService = AuthenticationService();
  final ProfileService profile = ProfileService();
  InspirationSefrvice ins = InspirationSefrvice();
  AddressService address = AddressService();

  List<inspirationModel> getinspiration = [];
  // List<inspirationModel> inspiration = [];
  List<GetprofileModel> profil = [];

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    await getserviceitemdata();
    await fetchInspiration();
  }

  Future<void> fetchInspiration() async {
    getinspiration = await ins.getallinspiration();
    setState(() {
      getinspiration = getinspiration
          .where(
              (inspiration) => inspiration.user == profil[0].userId.toString())
          .toList();
      // log(getinspiration.toString());
    });
  }

  Future<void> getserviceitemdata() async {
    try {
      profil = await profile.getprofile();

      setState(() {
        profil;
        // log(profil.toString());
      });
    } catch (e) {
      log('Error fetching service data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 190, 221),
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
          // actions: [
          //   IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         MdiIcons.googleTranslate,
          //         size: 45,
          //         color: const Color.fromRGBO(85, 32, 32, 1),
          //       ))
          // ],
        ),
        drawer: const Drawer123(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if (profil.isEmpty)
                const Center(
                  heightFactor: 10,
                  child: CircularProgressIndicator(),
                ),

              if (profil.isNotEmpty)
                profilephoto(
                    profil[0].firstName, profil[0].avatar.url.toString()),
              accountitem('My Booking', MdiIcons.listBoxOutline, context,
                  const ShowBooking()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Manage Profile', MdiIcons.account, context,
                  const ManageFprofile()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              if (getinspiration.isNotEmpty && profil.isNotEmpty)
                accountitem(
                    'Edit your inspiration',
                    MdiIcons.lightbulbOutline,
                    context,
                    Editpost(
                      getinspiration: getinspiration,
                      username: "${profil[0].firstName}  ${profil[0].lastName}",
                    )),
              if (getinspiration.isNotEmpty && profil.isNotEmpty)
                const Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Color.fromRGBO(68, 45, 45, 1),
                ),
              accountitem('Wishlist', MdiIcons.thumbUpOutline, context,
                  const WishListW()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              accountitem('Emergency Contacts', MdiIcons.contactsOutline, context,
                  const EmergencycontlistW()),
              const Divider(
                indent: 25,
                endIndent: 25,
                color: Color.fromRGBO(68, 45, 45, 1),
              ),
              // accountitem('Recommendation', MdiIcons.thumbUpOutline, context,
              //     const Recommendation()),
              // const Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Color.fromRGBO(68, 45, 45, 1),
              // ),
              // accountitem('Location', Icons.location_on_outlined, context,
              //     const LocationW()),
              // const Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Color.fromRGBO(68, 45, 45, 1),
              // ),
              // accountitem('Chats', MdiIcons.messageOutline, context,
              //     const ChatInboxW()),
              // const Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Color.fromRGBO(68, 45, 45, 1),
              // ),
              // accountitem('Contanct Support', MdiIcons.phoneOutline, context,
              //     const SupportW()),
              // const Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Color.fromRGBO(68, 45, 45, 1),
              // ),
              // accountitem('Write a Review', MdiIcons.pencilOutline, context,
              //     const Revieww()),
              // const Divider(
              //   indent: 25,
              //   endIndent: 25,
              //   color: Color.fromRGBO(68, 45, 45, 1),
              // ),
              // accountitem(
              // 'Log In/Out', MdiIcons.login, context, const Login_form()),
              Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Icon(
                    MdiIcons.login,
                    size: 45,
                    color: const Color.fromRGBO(68, 45, 45, 1),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  InkWell(
                    child: const Text('Log In/Out',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(68, 45, 45, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 26,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w600,
                            height: 1)),
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const LoginForm();
                        },
                      ));
                    },
                  ),
                ],
              ),
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
