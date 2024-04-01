import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/models/Inspiration/inspirationmodel.dart';
import 'package:wedding_planning_application/screen/common_components/drawer.dart';
import 'package:wedding_planning_application/screen/profile/screens/editscreenview.dart';
class Editpost extends StatefulWidget {
    const Editpost({super.key, required this.getinspiration, required this.username});

  final List<inspirationModel> getinspiration;
  final String username;

  @override
  State<Editpost> createState() => _EditpostState();
}

class _EditpostState extends State<Editpost> {
    
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        title: const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Your Inspiration ',
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
      drawer: const Drawer123(),
      body: Column(
        children: [
            const Divider(color: Colors.black,),
          const SizedBox(
            height: 10,
          ),
          if(widget.getinspiration.isEmpty) 
          const Center(
            heightFactor: 15,
            child: CircularProgressIndicator(),
          ),
          if(widget.getinspiration.isNotEmpty )
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 4,
                  itemCount: widget.getinspiration.length,
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
                          widget.getinspiration[index].image,
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          // log(profil.toString());
                          Get.to(() => Editscreenview(
                                index: widget.getinspiration[index].inspiration,
                                description: widget.getinspiration[index].description,
                                name: widget.getinspiration[index].user,
                                image: widget.getinspiration[index].image,
                                tags: widget.getinspiration[index].tags.join(','), 
                                userId:int.parse( widget.getinspiration[index].user),
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
      floatingActionButton: IconButton(
                color:  Colors.white,
            hoverColor: Colors.black,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(85, 32, 32, 1),),
                visualDensity: VisualDensity(horizontal: 1, vertical: 1)),
            onPressed: () {
              //  fetchProfileData(); // Call fetchProfileData when IconButton is pressed
            },
            icon: const Icon(
              Icons.refresh,
              size: 40,
            ), // Use refresh icon
          ),
    );
  }
}