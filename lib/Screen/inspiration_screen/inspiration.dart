import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/addinspiration.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/components/category_bar.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/show_inspiration.dart';
import 'package:wedding_planning_application/services/Inspiration/insapiration_service.dart';

class InspirationW extends StatefulWidget {
  const InspirationW({super.key});

  @override
  State<InspirationW> createState() => _InspirationWState();
}

class _InspirationWState extends State<InspirationW> {
  List<inspirationModel> getinspiration = [];
  @override
  void initState() {
    fetchInspiration();
    super.initState();
  }

  Future<void> fetchInspiration() async {
    try {
      InspirationSefrvice inspService = InspirationSefrvice();
      // Wait for the Future<List<inspirationModel>> to complete
      List<inspirationModel> inspirationList =
          await inspService.getallinspiration();
      setState(() {
        getinspiration = inspirationList;
        log(getinspiration.toString());
      });
    } catch (e) {
      log('Error fetching inspiration: $e');
    }
  }

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
      body: Column(
        children: [
          const SizedBox(
            height: 50,
            child: CategoryBar(categories: [
              'Dress',
              'Rustic Theme',
              'Red Wedding Dress',
              'Decoration',
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          if(getinspiration.isEmpty)
          const Center(
            heightFactor: 15,
            child: CircularProgressIndicator(),
          ),
          if(getinspiration.isNotEmpty)
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 4,
                  itemCount: getinspiration.length,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.grey)
                          ]),
                      child: InkWell(
                        child: Image.network(
                          getinspiration[index].image,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Get.to(() => ShowinspirationPhoto(
                                index: getinspiration[index].inspiration,
                                description: getinspiration[index].description,
                                name: getinspiration[index].user,
                                image: getinspiration[index].image,
                              ));
                        },
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) =>
                      const StaggeredTile.fit(2),
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(85, 32, 32, 1),
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(4, 4))),
        onPressed: () {
          Get.to(() => const AddinspirationW());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
