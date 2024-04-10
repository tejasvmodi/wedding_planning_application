import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/Address/citymodel.dart';
import 'package:wedding_planning_application/models/Address/statemdel.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_planning_application/repository/Profile/addphoto.dart';
import 'package:wedding_planning_application/screen/profile/Couple/coupleadd.dart';
import 'package:wedding_planning_application/screen/profile/components/profile_details.dart';
import 'package:wedding_planning_application/screen/profile/screens/manage_profile_groom.dart';
import 'package:wedding_planning_application/services/Address/addressService.dart';
import 'package:wedding_planning_application/services/profile.dart';

class ManageFprofile extends StatefulWidget {
  const ManageFprofile({
    super.key,
  });

  @override
  State<ManageFprofile> createState() => _ManageFprofileState();
}

class _ManageFprofileState extends State<ManageFprofile> {
  final ProfileService profile = Get.find();
  List<GetprofileModel> getuser = [];
  List<StateModel> getstate = [];
  List<CityModel> city = [];
  AddressService address = AddressService();
  final ImagePicker _picker =
      ImagePicker(); // Create an instance of ImagePicker
  XFile? _image; // Variable to store the selected image
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  int? selectedRelationship;
  int? selectedcity;
  String? selectedstate;
  int? id;
  @override
  void initState() {
    super.initState();
    getserviceitemdata();
    getstatedata();
    if (getuser.isNotEmpty) {
      email.text = getuser[0].email.toString();
      fname.text = getuser[0].firstName.toString();
      lname.text = getuser[0].lastName.toString();
    }
    setState(() {});
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery); // Open image picker
    if (pickedImage != null) {
      setState(() {
        _image = pickedImage; // Update selected image
      });
    }
  }

  Future<void> getcitydata(int id) async {
    city = await address.getcity(id);
    setState(() {
      city;
      log(city.toString());
    });
  }

  Future<void> getstatedata() async {
    getstate = await address.getstate();
    getstate;
    setState(() {
      log(getstate.toString());
    });
  }

  Future<void> getserviceitemdata() async {
    try {
      getuser = await profile.getprofile();
      setState(() {
        getuser;
        log(getuser.toString());
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
                    builder: (context) => const AddCouple(),
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
        child: Column(children: [
          if (getuser.isEmpty)
            const Center(
              heightFactor: 25,
              child: CircularProgressIndicator(),
            ),
          if (getuser.isNotEmpty)
            Column(
              children: [
                SizedBox(
                  width: 400,
                  height: 370,
                  child: Stack(children: <Widget>[
                    Container(
                      width: 500,
                      height: 265,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment(6.123234262925839e-17, 1),
                            end: Alignment(0, 123234262925839e-17),
                            colors: [
                              Color.fromRGBO(177, 83, 159, 1),
                              Color.fromRGBO(255, 217, 247, 0.6)
                            ]),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(177, 73, 129, 0.25),
                                blurRadius: 10,
                                spreadRadius: 3,
                                blurStyle: BlurStyle.inner),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 92,
                      child: InkWell(
                        onTap: _openImagePicker,
                        child: Container(
                            padding: const EdgeInsets.only(left: 134),
                            alignment: Alignment.bottomRight,
                            width: 195,
                            height: 195,
                            decoration: BoxDecoration(
                              border: const Border(
                                  bottom: BorderSide(color: Colors.black)),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    offset: Offset(0, 4),
                                    blurRadius: 3,
                                    spreadRadius: 1)
                              ],
                              image: _image != null
                                  ? DecorationImage(
                                      image: FileImage(File(_image!.path)),
                                      fit: BoxFit.fitWidth,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(
                                          getuser[0].avatar.url.toString()),
                                      fit: BoxFit.fitWidth,
                                    ),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(195, 195)),
                            ),
                            child: TextButton.icon(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(255, 254, 191, 191))),
                                onPressed: () async {
                                  if (_image != null) {
                                    MyRepository repository = MyRepository();
                                    repository.uploadFile(_image!);
                                    await getserviceitemdata();
                                  }

                                  setState(() {});
                                  log(_image!.path.toString());
                                },
                                icon: Icon(
                                  MdiIcons.pen,
                                  size: 20,
                                ),
                                label: const Text(''))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 325, left: 155),
                      child: SizedBox(
                        height: 50,
                        child: Text(
                          getuser[0].firstName,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(85, 32, 32, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 26,
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                      ),
                    ),
                  ]),
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
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: TextField(
                                      controller: fname,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: getuser.isNotEmpty
                                            ? getuser[0].firstName
                                            : '',
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
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  width: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: TextField(
                                      controller: lname,
                                      decoration: InputDecoration(
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        hintText: getuser.isNotEmpty
                                            ? getuser[0].lastName
                                            : '',
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

                profiledetails('Email', getuser[0].email, email),
                const SizedBox(
                  height: 25,
                ),
                profiledetails('Phone', getuser[0].phone.toString(), phone),
                const SizedBox(
                  height: 25,
                ),
                if (getuser.isNotEmpty && getuser[0].addressInfo != null)
                  // Use addressInfo safely
                  // Access addressLine2 safely
                  profiledetails(
                    'Address line 1',
                    getuser[0].addressInfo!.addressLine1.toString(),
                    address1,
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (getuser.isNotEmpty && getuser[0].addressInfo != null)

                  profiledetails(
                    'Address line 1',
                    getuser[0].addressInfo!.addressLine1.toString(),
                    address1,
                  ),

                const SizedBox(
                  height: 25,
                ),
                if (getuser.isNotEmpty && getuser[0].addressInfo == null)
                  // Use addressInfo safely

                  // Access addressLine2 safely
                  profiledetails(
                    'Address line 1',
                    'enter the Address ',
                    address1,
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (getuser.isNotEmpty && getuser[0].addressInfo == null)
                  // Use addressInfo safely

                  // Access addressLine2 safely
                  profiledetails(
                    'Address line 2',
                    'enter the Address ',
                    address2,
                  ),
                const SizedBox(
                  height: 25,
                ),
                if (getstate.isNotEmpty)
                  SizedBox(
                    width: 370,
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 370,
                            height: 70,
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
                            child: DropDownWidget(
                              onRelationShipSelected: (value) {
                                setState(() {
                                  selectedRelationship = int.parse(value);
                                });
                                log(selectedRelationship.toString());
                                getcitydata(selectedRelationship!);
                              },
                              relations: getstate,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                const SizedBox(
                  height: 25,
                ),

                if (city.isNotEmpty)
                  SizedBox(
                    width: 370,
                    height: 70,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: 370,
                            height: 70,
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
                            child: Citydropdown(
                              onRelationShipSelected: (value) {
                                setState(() {
                                  selectedcity = int.parse(value);
                                });
                                log(selectedcity.toString());
                              },
                              relations: city,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                const SizedBox(
                  height: 25,
                ),
                // profiledetails('City', getuser[0].addressInfo.toString()),
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
                                  'bride',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(
                              MediaQuery.of(context).size.width * 0.40,
                              MediaQuery.of(context).size.height * 0.07)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(54, 29, 29, 1)),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 8))),
                          ),
                        ),
                        onPressed: () async {
                          if (email.text.isEmpty) {
                            email.text = getuser[0].email.toString();
                          }
                          if (fname.text.isEmpty) {
                            fname.text = getuser[0].firstName.toString();
                          }
                          if (lname.text.isEmpty) {
                            lname.text = getuser[0].lastName.toString();
                          }
                          if (phone.text.isEmpty) {
                            phone.text = getuser[0].phone.toString();
                          }

                          profile.updateuser(getuser[0].userId, fname.text,
                              lname.text, email.text, phone.text);
                          setState(() async {
                            await getserviceitemdata();
                          });
                        },
                        child: const Text(
                          'Change Information',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStatePropertyAll(Size(
                              MediaQuery.of(context).size.width * 0.40,
                              MediaQuery.of(context).size.height * 0.07)),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromRGBO(54, 29, 29, 1)),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(8, 8))),
                          ),
                        ),
                        onPressed: () {
                          log(address1.text);
                          log(address2.text);
                          log(selectedcity.toString());
                          address.addadress(
                              address1.text, address2.text, selectedcity!);
                        },
                        child: const Text(
                          ' Add Address',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'EBGaramond',
                            fontSize: 18,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
        ]),
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  final List<StateModel> relations;
  final Function(String)? onRelationShipSelected;
  final Function(String)? onRelation;

  const DropDownWidget({
    super.key,
    required this.relations,
    this.onRelationShipSelected,
    this.onRelation,
  });

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedValue;
  String? selectedstate;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            hint: const Text(
              'Select State',
              style: TextStyle(
                color: Color.fromRGBO(85, 32, 32, 1),
                fontFamily: 'EBGaramond',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            value: selectedValue,
            items: widget.relations
                .map(
                  (relation) => DropdownMenuItem<String>(
                    value: relation.stateId.toString(),
                    child: Text(
                      relation.stateName,
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;

                widget.onRelationShipSelected!(value!);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select the Relationship.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class Citydropdown extends StatefulWidget {
  const Citydropdown({
    super.key,
    required this.relations,
    this.onRelationShipSelected,
  });

  final List<CityModel> relations;
  final Function(String)? onRelationShipSelected;

  @override
  State<Citydropdown> createState() => _CitydropdownState();
}

class _CitydropdownState extends State<Citydropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            hint: const Text(
              'Select City',
              style: TextStyle(
                color: Color.fromRGBO(85, 32, 32, 1),
                fontFamily: 'EBGaramond',
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
            value: selectedValue,
            items: widget.relations
                .map(
                  (city) => DropdownMenuItem<String>(
                    value: city.cityId.toString(),
                    child: Text(
                      city.cityName.toString(),
                      style: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
                widget.onRelationShipSelected!(value!);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a city.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
