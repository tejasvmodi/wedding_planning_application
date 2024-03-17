import 'package:flutter/material.dart';


class ExploreTil extends StatelessWidget {
  const ExploreTil({super.key});
  // final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      color: Colors.pink,
      child:  Stack(
        alignment: Alignment.topRight,
        children: [
           const Image(image: AssetImage("assets/images/inspiration_feed_dress_1.jpg"),fit: BoxFit.cover,),
          Container(
            padding: const EdgeInsets.all(10),
            // child: const Icon(Icons.collections_rounded,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}