import 'package:flutter/material.dart';

class inquiryW extends StatelessWidget {
  const inquiryW({super.key});

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
        title: const Padding(
          padding: EdgeInsets.only(left: 80),
          child: Text(
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
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 23),
              height: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/icon_inquiry.png'),
              )),
              
            ),
            const SizedBox(height: 50,),
           
             Container(
                 height: 250,
              width: 360,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius:
                      const BorderRadius.all(Radius.elliptical(23, 34)),
                  boxShadow: const [
                    BoxShadow(blurRadius: 3, color: Colors.transparent)
                  ]),
                  child: Stack(
                    children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      right: 20,
                      child: Container(
                        height: 120,
                         decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(23, 23)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 1),
                                  blurRadius: 4,
                                )
                              ],
                              color: Color.fromRGBO(245, 201, 238, 1),
                            ),
                            child:  TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 4,
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(245, 201, 238, 1),
                                focusColor: Colors.transparent,
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(23, 23)))
                              ),
                              style: TextStyle(
                                    color: Color.fromRGBO(85, 32, 32, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1),
                            ),
                      ),
               ),
                    ],
                  ),
              ),
    
          ],
        ),
      ),
    );
  }
}
