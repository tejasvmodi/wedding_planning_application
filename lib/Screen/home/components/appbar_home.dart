import 'package:flutter/material.dart';

class AppbarHome extends StatefulWidget {
  const AppbarHome({super.key});

  @override
  State<AppbarHome> createState() => _AppbarHomeState();
}

class _AppbarHomeState extends State<AppbarHome> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 12,
          ),
          SizedBox(
            height: 40,
            width:300,
            child: TextField(
               enabled: false,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'EBGaramond',
                  fontSize: 20,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w300,
                  height: 1),
              decoration: InputDecoration(
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                label: Text(
                  'Search...',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'EBGaramond',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700,
                      height: 1),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                fillColor: Color.fromRGBO(53, 22, 22, 0.6399999856948853),
                filled: true,
              ),
            ),
          ),
          SizedBox(
            width: 23,
          ),
         
        ],
      ),
    );
  }
}
