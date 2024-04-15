import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planning_application/models/Budget/getbudget.dart';
import 'package:wedding_planning_application/models/Couple/Getcouple.dart';
import 'package:wedding_planning_application/models/service_category.dart';
import 'package:wedding_planning_application/screen/Screen_Navigation.dart';
import 'package:wedding_planning_application/services/Budget/budgetservice.dart';
import 'package:wedding_planning_application/services/Userid/userid.dart';
import 'package:wedding_planning_application/services/core/service_category_service.dart';

class Budget extends StatefulWidget {
  const Budget({super.key});

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double count = 0;
  double count1 = 0;
  TextEditingController price = TextEditingController();
  TextEditingController changeprice = TextEditingController();
  String? id;
  bool bride = false;
  String? _selectedGender;
  List<Getcouple> updatedCoupleList = [];
  int userId1 = 0;
  bool pressed = false;
  String? title;
  BudgetService budget = BudgetService();
  List<Getbudget> getbudget = [];
  List<Getbudget> getbudgetcouple = [];
  List<ServiceCategory> items = [];
  @override
  void initState() {
    super.initState();
    someFunction();
    getServiceCategories();
    getbudgetdata();
    _loadGenderFromPrefs().then((value) {
      if (updatedCoupleList.isNotEmpty) {
        log(updatedCoupleList[0].groom.toString());
        log(userId1.toString());
        if (int.parse(updatedCoupleList[0].groom.toString()) == userId1) {
          getbudgetdatacpouple(
              int.parse(updatedCoupleList[0].bride.toString()));
          log('not come here');
          log(updatedCoupleList[0].bride.toString());
        } else {
          getbudgetdatacpouple(
              int.parse(updatedCoupleList[0].groom.toString()));
          log('direct here ');
          log(updatedCoupleList[0].groom.toString());
        }
      } else {
        log('Wait for the seconds ');
      }
    });
  }

  Future<void> someFunction() async {
    final userId = await getUserId();
    if (userId != null) {
      userId1 = userId;
      // Use the user ID for further processing
      setState(() {
        userId1;
        log(userId1.toString());
      });
    } else {
      log('User ID not found in SharedPreferences');
    }
  }

  Future<void> _loadGenderFromPrefs() async {
    final Getcouple? storedCouple = await getCouple();

    if (storedCouple != null) {
      setState(() {
        updatedCoupleList = [storedCouple];
      });

      if (userId1 != 0 && updatedCoupleList.isNotEmpty) {
        if (int.parse(updatedCoupleList[0].groom.toString()) != userId1) {
          if (int.parse(updatedCoupleList[0].bride.toString()) == userId1) {
            bride = true;
          } else {
            bride = false;
          }
        }
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _selectedGender = (prefs.getString('gender') ?? 'BRIDE');
      log('No couples found in SharedPreferences.');
    }
  }

  Future<void> getbudgetdatacpouple(int id) async {
    try {
      getbudgetcouple = await budget.getbudgetv(id);
      setState(() {
        getbudgetcouple;
        log(getbudgetcouple.toString());
        if (getbudgetcouple.isNotEmpty) {
          for (var get in getbudgetcouple) {
            count1 += get.expenceAmount.toDouble();
          }
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getbudgetdata() async {
    try {
      getbudget = await budget.getbudget();
      setState(() {
        getbudget;
        log(getbudget.toString());
        if (getbudget.isNotEmpty) {
          for (var get in getbudget) {
            count += get.expenceAmount.toDouble();
          }
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getServiceCategories() async {
    final ServicecategoryService categoryService = ServicecategoryService();
    await categoryService.getServicecategories().then((value) {
      setState(() {
        items = value.items;
        log(items.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        leading: IconButton(
          onPressed: () {
            Get.to(ScreenNavigation(
              currentIndex: 0,
            ));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'Budget',
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
      ),
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 217, 249, 0.8),
              ]),
          border: Border.symmetric(horizontal: BorderSide(color: Colors.black)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              if (updatedCoupleList.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    ),
                    elevation: 5,
                    child: ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)),
                      ),
                      backgroundColor: const Color.fromRGBO(239, 226, 239, 1),
                      iconColor: const Color.fromRGBO(96, 66, 66, 1),
                      tilePadding: const EdgeInsets.all(5),
                      collapsedIconColor: const Color.fromRGBO(96, 66, 66, 1),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: bride == false
                              ? expandedtitle(
                                  'assets/images/icon_bride.png',
                                  count1,
                                  "Bride's Budget: ",
                                )
                              : expandedtitle(
                                  'assets/images/icon_groom.png',
                                  count1,
                                  "Groom's Budget: ",
                                ),
                        ),
                      ),
                      children: [
                        SizedBox(
                          height: 400, // Adjust the height to limit expansion
                          child: ListView(
                            shrinkWrap: true, // Allow the ListView to shrink
                            children: [
                              const SizedBox(height: 10),
                              if (getbudgetcouple.isNotEmpty)
                                for (int i = 0; i < getbudgetcouple.length; i++)
                                  InkWell(
                                    child: budgetBox1(
                                        getbudgetcouple[i]
                                            .serviceCategory['icon'],
                                        getbudgetcouple[i].serviceCategory[
                                            'serviceCategoryName'],
                                        getbudgetcouple[i].expenceAmount,
                                        getbudgetcouple[i].budgetId),
                                    onTap: () {},
                                  ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                    ),
                    elevation: 5,
                    child: ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)),
                      ),
                      backgroundColor: const Color.fromRGBO(239, 226, 239, 1),
                      iconColor: const Color.fromRGBO(96, 66, 66, 1),
                      tilePadding: const EdgeInsets.all(5),
                      collapsedIconColor: const Color.fromRGBO(96, 66, 66, 1),
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: updatedCoupleList.isNotEmpty
                            ? Container(
                                child: bride
                                    ? expandedtitle(
                                        'assets/images/icon_bride.png',
                                        count,
                                        "Your's Budget: ",
                                      )
                                    : expandedtitle(
                                        'assets/images/icon_groom.png',
                                        count,
                                        "Your's Budget: ",
                                      ),
                              )
                            : _selectedGender != 'BRIDE'
                                ? expandedtitle(
                                    'assets/images/icon_groom.png',
                                    count,
                                    "Your's Budget: ",
                                  )
                                : expandedtitle(
                                    'assets/images/icon_bride.png',
                                    count,
                                    "Your's Budget: ",
                                  ),
                      ),
                      children: [
                        SizedBox(
                          height: 400, // Adjust the height to limit expansion
                          child: ListView(
                            padding: const EdgeInsets.only(
                                left: 20), // Allow the ListView to shrink
                            children: [
                              const SizedBox(height: 10),
                              if (getbudget.isNotEmpty)
                                for (int i = 0; i < getbudget.length; i++)
                                  InkWell(
                                    child: budgetBox(
                                        getbudget[i].serviceCategory['icon'],
                                        getbudget[i].serviceCategory[
                                            'serviceCategoryName'],
                                        getbudget[i].expenceAmount,
                                        getbudget[i].budgetId),
                                    onTap: () {
                                      changeprice.text =
                                          getbudget[i].expenceAmount.toString();
                                      updatebudget(
                                          context,
                                          items,
                                          changeprice,
                                          getbudget[i].budgetId,
                                          getbudget[i].serviceCategory[
                                              'serviceCategoryId']);
                                    },
                                  ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: InkWell(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.elliptical(23, 23),
                  topLeft: Radius.elliptical(23, 23)),
              gradient: const LinearGradient(
                  begin: Alignment(6.123234262925839e-17, 1),
                  end: Alignment(-1, 6.123234262925839e-17),
                  colors: [
                    Color.fromRGBO(215, 187, 187, 1),
                    Color.fromRGBO(244, 225, 225, 1),
                  ]),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 5,
                    blurStyle: BlurStyle.normal,
                    color: Color.fromRGBO(214, 187, 187, 1),
                    spreadRadius: 5)
              ]),
          height: 70,
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  MdiIcons.plusCircleOutline,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  'Add Item',
                  style: TextStyle(
                    color: Color.fromRGBO(62, 53, 53, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 25,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(244, 225, 225, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(23, 23),
                        topRight: Radius.elliptical(23, 23))),
                child: Form(
                    child: SingleChildScrollView(
                  child: AnimatedPadding(
                    padding: MediaQuery.of(context).viewInsets,
                    duration: const Duration(milliseconds: 23),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Citymodel(
                                  relations: items,
                                  onRelationShipSelected: (value) {
                                    setState(() {
                                      id = value;
                                    });
                                  })),
                          Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.9),
                                      blurRadius: 10.0)
                                ],
                              ),
                              width: 250,
                              margin: const EdgeInsets.all(10),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                controller: price,
                                maxLines: 1,
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black), // Your desired enabled border color
                                  ),
                                  filled: true,
                                  fillColor: Color.fromRGBO(217, 184, 184, 1),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(23, 23))),
                                  hintText: 'Enter The Approximate amount',
                                  hintStyle: TextStyle(
                                    color: Color.fromRGBO(96, 67, 67, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                                style: const TextStyle(
                                  color: Color.fromRGBO(96, 67, 67, 1),
                                  fontFamily: 'EBGaramond',
                                  fontSize: 18,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              )),
                          TextButton(
                              onPressed: () async {
                                log(price.text);
                                List<String> it = [];
                                it.add(id.toString());

                                budget.addbudget(double.parse(price.text),
                                    int.parse(id.toString()));

                                _showMyDialog(context);
                              },
                              style: const ButtonStyle(
                                minimumSize:
                                    MaterialStatePropertyAll(Size(210, 60)),
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(54, 29, 29, 1)),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(8, 8))),
                                ),
                              ),
                              child: const Text(
                                'Confirm entry',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'EBGaramond',
                                  fontSize: 25,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              );
            },
          );
        },
      ),
    );
  }
}

Widget expandedtitle(String image, double number, String title) {
  final formattedPrice1 =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹', decimalDigits: 0)
          .format(number);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Text(
        title,
        style: const TextStyle(
          color: Color.fromRGBO(96, 66, 66, 1),
          fontFamily: 'EBGaramond',
          fontSize: 18,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      ),
      Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/rupee.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Flexible(
        flex: 3,
        child: Text(
          formattedPrice1,
          style: const TextStyle(
            color: Color.fromRGBO(96, 66, 66, 1),
            fontFamily: 'EBGaramond',
            fontSize: 22,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
            height: 1,
          ),
        ),
      ),
    ],
  );
}

Widget budgetBox(
    String imageLink, String venueName, double venuePrice, int id) {
  final formattedPrice =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(venuePrice);

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(
          width: 320,
          height: 80,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  width: 310,
                  height: 70,
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
                    color: const Color.fromRGBO(221, 189, 190, 1),
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
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              imageLink,
                            ),
                            fit: BoxFit.cover,
                            opacity: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(65, 65)),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          children: [
                            TextSpan(
                              text: '$venueName\n',
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                height: 25,
                              ),
                            ),
                            TextSpan(
                              text: 'Estimated Amount: $formattedPrice',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        TextButton(
            onPressed: () {
              BudgetService service = BudgetService();
              service.deletbudget(id);
            },
            child: Icon(MdiIcons.delete))
      ],
    ),
  );
}

Widget budgetBox1(
    String imageLink, String venueName, double venuePrice, int id) {
  final formattedPrice =
      NumberFormat.currency(locale: 'en_IN', symbol: '₹').format(venuePrice);

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        SizedBox(
          width: 320,
          height: 80,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 10,
                child: Container(
                  width: 310,
                  height: 70,
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
                    color: const Color.fromRGBO(221, 189, 190, 1),
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
                      Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              imageLink,
                            ),
                            fit: BoxFit.cover,
                            opacity: 1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(65, 65)),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            height: 1,
                          ),
                          children: [
                            TextSpan(
                              text: '$venueName\n',
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                height: 25,
                              ),
                            ),
                            TextSpan(
                              text: 'Estimated Amount: $formattedPrice',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Colors.black38,
        title: Center(
          child: Icon(
            MdiIcons.check,
            size: 50,
          ),
        ),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Your Budget list is successfully added',
                style: TextStyle(
                  color: Color.fromRGBO(62, 53, 53, 1),
                  fontFamily: 'EBGaramond',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
                onPressed: () {
                  Get.offAll(() => const Budget());
                },
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(210, 60)),
                  backgroundColor:
                      MaterialStatePropertyAll(Color.fromRGBO(54, 29, 29, 1)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(8, 8))),
                  ),
                ),
                child: const Text(
                  'Back to the Budget',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'EBGaramond',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                )),
          ),
        ],
      );
    },
  );
}

class Citymodel extends StatefulWidget {
  const Citymodel(
      {super.key, required this.relations, this.onRelationShipSelected});
  final List<ServiceCategory> relations;
  final Function(String)? onRelationShipSelected;

  @override
  State<Citymodel> createState() => _CitymodelState();
}

class _CitymodelState extends State<Citymodel> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: const Color.fromRGBO(217, 184, 184, 1),
      ),
      height: 70,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            hint: const Text(
              'Select Service Category',
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
                    value: relation.serviceCategoryId.toString(),
                    child: Text(
                      relation.serviceCategoryName.toString(),
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

//update budget dialog box
Future<void> updatebudget(
    BuildContext context,
    List<ServiceCategory> service,
    TextEditingController changeprice,
    int budgetid,
    int serviceCategoryId) async {
  showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: Colors.black38,
        title: const Center(child: Text('Change Budget ')),
        content: SingleChildScrollView(
            child: Column(
          children: [
            Citymodel(relations: service),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: changeprice,
              maxLines: 1,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Your desired enabled border color
                ),
                filled: true,
                fillColor: Color.fromRGBO(217, 184, 184, 1),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.elliptical(23, 23))),
                hintText: 'Enter The Approximate amount',
                hintStyle: TextStyle(
                  color: Color.fromRGBO(96, 67, 67, 1),
                  fontFamily: 'EBGaramond',
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
              style: const TextStyle(
                color: Color.fromRGBO(96, 67, 67, 1),
                fontFamily: 'EBGaramond',
                fontSize: 18,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ],
        )),
        actions: <Widget>[
          Center(
            child: TextButton(
                onPressed: () {
                  BudgetService budget = BudgetService();
                  budget
                      .updatebudget(double.parse(changeprice.text), budgetid,
                          serviceCategoryId)
                ;
                },
                style: ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(
                      MediaQuery.of(context).size.width * 0.50,
                      MediaQuery.of(context).size.height * 0.07)),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(54, 29, 29, 1)),
                  shape: const MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(8, 8))),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'EBGaramond',
                    fontSize: 18,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                )),
          ),
        ],
      );
    },
  );
}
