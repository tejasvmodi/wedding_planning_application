import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/models/ProfileModels/getprofilemodel.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/addinspiration.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/components/category_bar.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/show_inspiration.dart';
import 'package:wedding_planning_application/services/Inspiration/insapiration_service.dart';
import 'package:wedding_planning_application/services/profile.dart';

class InspirationW extends StatefulWidget {
  const InspirationW({super.key});

  @override
  State<InspirationW> createState() => _InspirationWState();
}

class _InspirationWState extends State<InspirationW> {
  InspirationSefrvice ins = InspirationSefrvice();
  final ProfileService userinfo = Get.find();
  List<inspirationModel> getinspiration = [];
  List<GetprofileModel> profil = [];
  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    await getserviceitemdata();
    await fetchInspiration();
  }

  Future<void> getserviceitemdata() async {
    try {
      profil = await userinfo.getprofile();
      setState(() {
        profil;
        // log(profil.toString());
      });
    } catch (e) {
      log('Error fetching service data: $e');
    }
  }

  Future<void> fetchInspiration() async {
    getinspiration = await ins.getallinspiration();
    setState(() {
      getinspiration;
      log(getinspiration.toString());
    });
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
          if (getinspiration.isEmpty)
            const Center(
              heightFactor: 15,
              child: CircularProgressIndicator(),
            ),
          if (getinspiration.isNotEmpty)
          
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
                              log(profil.toString());
                              Get.to(() => ShowinspirationPhoto(
                                    index: getinspiration[index].inspiration,
                                    description:
                                        getinspiration[index].description,
                                    name: getinspiration[index].user,
                                    image: getinspiration[index].image,
                                    tags: getinspiration[index].tags.join(','),
                                    userId: profil[0].userId,
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
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
              IconButton(
                color:  Colors.white,
            hoverColor: Colors.black,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(85, 32, 32, 1),),
                visualDensity: VisualDensity(horizontal: 1, vertical: 1)),
            onPressed: () {
              fetchProfileData(); // Call fetchProfileData when IconButton is pressed
            },
            icon: const Icon(
              Icons.refresh,
              size: 40,
            ), // Use refresh icon
          ),
          const SizedBox(height: 10,),
          FloatingActionButton(
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
        ],
      ),
    );
  }
}
