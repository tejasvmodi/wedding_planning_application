import 'package:flutter/material.dart';

class Category_bar extends StatefulWidget {
  const Category_bar({Key? key, required this.categories}) : super(key: key);

  final List<String> categories;

  @override
  State<Category_bar> createState() => _Category_barState();
}

class _Category_barState extends State<Category_bar> {
  Color clr=const Color.fromRGBO(176, 132, 132, 0.8);
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 4)],
        border: Border.all(color: Colors.black45),
        color: const Color.fromRGBO(255, 217, 249, 1),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: TextButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(clr),
              shadowColor: const MaterialStatePropertyAll(Colors.black,),
              animationDuration: const Duration(milliseconds: 230),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(8, 8))))
              ),
              onPressed: () {
                clr=const Color.fromRGBO(96, 67,67, 0.8);
                setState(() {
                  
                });
              },
          
              child: Text(
                widget.categories[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'EBGaramond',
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
          );
        },
        itemCount: widget.categories.length,
          scrollDirection: Axis.horizontal,
      ),
    );
  }
}
