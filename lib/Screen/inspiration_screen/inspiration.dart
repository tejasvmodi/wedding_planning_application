import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/repository/Inspiration/getinsprationrepo.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/addinspiration.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/components/category_bar.dart';


class InspirationW extends StatefulWidget {
  const InspirationW({super.key});

  @override
  State<InspirationW> createState() => _InspirationWState();
}

class _InspirationWState extends State<InspirationW> {
   void initState() {
  Getnspirationrepo repo=Getnspirationrepo();
  repo.getInspation();
  
    super.initState();
  }
  // final List<String> images = [
  //   'assets/images/inspiration_feed_dress_1.jpg',
  //   'assets/images/inspiration_feed_dress_2.jpg',
  //   'assets/images/inspiration_feed_dress_3.jpg',
  //   'assets/images/inspiration_feed_dress_4.jpg',
  //   'assets/images/inspiration_feed_dress_5.jpg',
  //   'assets/images/inspiration_feed_dress_6.jpg',
  //   'assets/images/inspiration_feed_dress_7.jpg',
  //   'assets/images/inspiration_feed_dress_8.jpg',
  //   'assets/images/inspiration_feed_dress_9.jpg',
  //   'assets/images/inspiration_feed_dress_10.jpg',
  //   'assets/images/inspiration_feed_dress_11.jpg',
  // ];

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
            icon: Icon(
              MdiIcons.bookmarkOutline,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
      ),
      drawer: const Drawer123(),
      body: const Column(
        children: [
          SizedBox(
            height: 50,
            child: CategoryBar(categories: [
              'Dress',
              'Rustic Theme',
              'Red Wedding Dress',
              'Decoration',
            ]),
          ),
          // Expanded(
          //   child: CustomScrollView(
          //     slivers: [
          //       SliverStaggeredGrid.countBuilder(
          //         crossAxisCount: 4,
          //         itemCount: images.length,
          //         itemBuilder: (BuildContext context, int index) => Card(
          //           child: InkWell(
          //             child: Image.asset(
          //               images[index],
          //               fit: BoxFit.cover,
          //               // Adjust this based on your requirement
          //             ),
          //             onTap: () {
          //               Get.to(() => ShowinspirationPhoto(
          //                     index: index,
          //                   ));
          //             },
          //           ),
          //         ),
          //         staggeredTileBuilder: (int index) =>
          //             const StaggeredTile.fit(2),
          //         mainAxisSpacing: 3.0,
          //         crossAxisSpacing: 3.0,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
          floatingActionButton:  FloatingActionButton(
            backgroundColor: const Color.fromRGBO(85, 32, 32, 1),
            shape: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.elliptical(4, 4))),
            onPressed: () {
            Get.to(()=> const AddinspirationW());
          }, child: const Icon(Icons.add,color: Colors.white,size: 50,), ),
    );
  }
}
