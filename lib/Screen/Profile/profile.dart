import 'package:flutter/material.dart';

class ProfileW extends StatefulWidget {
  const ProfileW({super.key});

  @override
  State<ProfileW> createState() => _ProfileWState();
}

class _ProfileWState extends State<ProfileW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 286,
      child: Stack(children: <Widget>[
        Positioned(
          top: 0,
          bottom: 0,
          child: Container(
            width: 360,
            height: 210,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                )
              ],
              gradient: LinearGradient(
                  begin: Alignment(6.123234262925839e-17, 1),
                  end: Alignment(-1, 6.123234262925839e-17),
                  colors: [
                    Color.fromRGBO(255, 255, 255, 0),
                    Color.fromRGBO(177, 79, 129, 1)
                  ]),
            ),
          ),
        ),
        const Positioned(top: 255,
        left: 151,
        child: Text('Anjali',textAlign: TextAlign.center, style: TextStyle(
        color: Color.fromRGBO(85, 32, 32, 1),
        fontFamily: 'EB Garamond',
        fontSize: 24,
        letterSpacing: 0 ,
        fontWeight: FontWeight.normal,
        height: 1
      ),),),
      Positioned(
        top: 75,
        left: 92,
        child: Container(
          width: 175,
          height: 175,
          decoration: const BoxDecoration(
            boxShadow: [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            )],
            image: DecorationImage(image: AssetImage('assets/images/Account Icon.jpg'),fit: BoxFit.fitWidth),
            borderRadius: BorderRadius.all(Radius.elliptical(175, 175)),
          ),
        ))
      ]
      ),
    );
  }
}
