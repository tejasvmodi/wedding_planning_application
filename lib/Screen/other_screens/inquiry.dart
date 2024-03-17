import 'package:flutter/material.dart';

class InquiryW extends StatefulWidget {
  const InquiryW({super.key});

  @override
  State<InquiryW> createState() => _InquiryWState();
}

class _InquiryWState extends State<InquiryW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromRGBO(62, 53, 53, 1),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.22,
            ),
            child: const Text(
              'Inquiry',
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
        ),
        body: Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
              color: Color.fromRGBO(111, 80, 80, 1),
            )),
            gradient: LinearGradient(
                begin: Alignment(6.123234262925839e-17, 1),
                end: Alignment(-1, 6.123234262925839e-17),
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  Color.fromRGBO(255, 231, 255, 1),
                  Color.fromRGBO(255, 219, 249, 1),
                ]),
          ),
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.185,
              width: MediaQuery.of(context).size.width * 0.375,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/icon_inquiry.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.92,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(23, 34)),
                  boxShadow: const [
                    BoxShadow(blurRadius: 3, color: Colors.transparent)
                  ]),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(23, 23)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 1),
                          blurRadius: 4,
                        )
                      ],
                      color: Color.fromRGBO(245, 201, 238, 1),
                    ),
                    child: const TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Write Inquiry',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(85, 32, 32, 1),
                            fontFamily: 'EBGaramond',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                      // controller: TextEditingController(text:),
                      style: TextStyle(
                          color: Color.fromRGBO(85, 32, 32, 1),
                          fontFamily: 'EBGaramond',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(
                                Color.fromRGBO(77, 43, 43, 1)),
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(55),
                            )),
                            shadowColor:
                                const MaterialStatePropertyAll(Colors.grey)),
                        child: const Text(
                          'Get A Quote ',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'EBGaramond',
                              fontSize: 23,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w400,
                              height: 1),
                        )),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
