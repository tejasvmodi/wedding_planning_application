import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/Screen/Inspiration%20Screen/Inspiration%20Screen%20component/category_bar.dart';
import 'package:wedding_planning_application/Screen/Inspiration%20Screen/showinspiration.dart';
import 'package:wedding_planning_application/Screen/components/drawer.dart';

class InspirationW extends StatefulWidget {
  const InspirationW({Key? key}) : super(key: key);

  @override
  State<InspirationW> createState() => _InspirationWState();
}

class _InspirationWState extends State<InspirationW> {
  final List<String> images = [
    'assets/images/inspiration_feed_dress_1.jpg',
    'assets/images/inspiration_feed_dress_2.jpg',
    'assets/images/inspiration_feed_dress_3.jpg',
    'assets/images/inspiration_feed_dress_4.jpg',
    'assets/images/inspiration_feed_dress_5.jpg',
    'assets/images/inspiration_feed_dress_6.jpg',
    'assets/images/inspiration_feed_dress_7.jpg',
    'assets/images/inspiration_feed_dress_8.jpg',
    'assets/images/inspiration_feed_dress_9.jpg',
    'assets/images/inspiration_feed_dress_10.jpg',
    'assets/images/inspiration_feed_dress_11.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
       
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Inspiration ',
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
          IconButton(
            onPressed: () {},
            icon:  Icon(
              MdiIcons.bookmarkOutline,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      drawer: Drawer123(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
            child: Category_bar(categories: [
              'Dress',
              'Rustic Theme',
              'Red Wedding Dress',
              'Decoration',
            ]),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 4,
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: InkWell(
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                        // Adjust this based on your requirement
                      ),
                      onTap: () {
                        Get.to(()=> ShowinspirationPhoto(index: index,));
                      },
                    ),
                  ),
                  staggeredTileBuilder: (int index) => const StaggeredTile.fit(2),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
