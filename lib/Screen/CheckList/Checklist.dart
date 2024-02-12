import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CheckListW extends StatefulWidget {
  const CheckListW({Key? key}) : super(key: key);

  @override
  State<CheckListW> createState() => _CheckListWState();
}

class _CheckListWState extends State<CheckListW> {
  bool allSelected = false;
  Icon icon = Icon(MdiIcons.refresh, size: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(62, 53, 53, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'CheckList',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(62, 53, 53, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              letterSpacing: 0,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              allSelected ? MdiIcons.refresh : MdiIcons.check,
              size: 30,
              color: const Color.fromRGBO(62, 53, 53, 1),
            ),
          ),
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            border:
                Border.symmetric(horizontal: BorderSide(color: Colors.black26)),
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 219, 249, 1),
                  Color.fromRGBO(255, 219, 249, 1),
                ]),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 15, right: 15),
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/icon_bride.png'))),
                    ),
                    const Text('Bride',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 30,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        )),
                  ],
                ),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Set a Date'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Set a Date'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Decide Wedding Budget'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Browse and Book Venue'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Think of the guestlist'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Outline the wedding budget'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Book wedding photographer and videographer'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Browse and check for the catering  nearby '),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem(
                    'Book the weddingregistration/religious minister'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 25, left: 15, right: 15),
                      height: 50,
                      width: 70,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/icon_groom.png'))),
                    ),
                    const Text('Groom',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(62, 53, 53, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 30,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        )),
                  ],
                ),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Set a Date'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Set a Date'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Decide Wedding Budget'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Browse and Book Venue'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Think of the guestlist'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Outline the wedding budget'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Book wedding photographer and videographer'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem('Browse and check for the catering  nearby '),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
                checklistitem(
                    'Book the weddingregistration/religious minister'),
                const Divider(
                  indent: 15,
                  color: Colors.black26,
                ),
              ],
            ),
          )),
      bottomSheet: InkWell(
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black26)),
              borderRadius: BorderRadius.only(
                  topRight: Radius.elliptical(23, 23),
                  topLeft: Radius.elliptical(23, 23)),
              gradient: LinearGradient(
                  begin: Alignment(6.123234262925839e-17, 1),
                  end: Alignment(-1, 6.123234262925839e-17),
                  colors: [
                    Color.fromRGBO(215, 187, 187, 1),
                    Color.fromRGBO(244, 225, 225, 1),
                  ]),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
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
                  'Add Entry',
                  style: TextStyle(
                    color: Color.fromRGBO(62, 53, 53, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 25,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {
          showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return  Container(
            height:200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.elliptical(23, 23)),
              color: Color.fromRGBO(244, 225, 225, 1),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    width: 280,
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            hintText: 'Browse and save wedding dress',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(62, 53, 53, 1),
                              fontFamily: 'EBGaramond',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                            filled: true,
                            fillColor: Color.fromRGBO(217, 184, 184, 1),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(23, 23)))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(         
                        backgroundColor: const MaterialStatePropertyAll(
                          Color.fromRGBO(96, 67, 67, 1),
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Confirm Entry..',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'EBGaramond',
                          fontSize: 15,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      )),
                ],
              ),
            ),
          );
        
      },
    );
        },
      ),
    );
  }


  

  Container checklistitem(String itemdetail, {bool check = false}) {
    return Container(
      padding: const EdgeInsets.only(
        top: 5,
        left: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                setState(() {
                  icon = Icon(
                    MdiIcons.check,
                    size: 50,
                  );
                });
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                Color.fromRGBO(255, 217, 249, 1),
              )),
              child: icon),
          SizedBox(
            width: 250,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(itemdetail.toString(),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: const Color.fromRGBO(62, 53, 53, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      decoration: check ? TextDecoration.lineThrough : null,
                      overflow: TextOverflow.ellipsis)),
            ),
          )
        ],
      ),
    );
  }
}
