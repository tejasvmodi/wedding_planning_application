import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_planning_application/screen/inspiration_screen/inspiration.dart';
import 'package:wedding_planning_application/services/Inspiration/insapiration_service.dart';


class AddinspirationW extends StatefulWidget {
  const AddinspirationW({super.key});

  @override
  State<AddinspirationW> createState() => _AddinspirationWState();
}

class _AddinspirationWState extends State<AddinspirationW> {
  InspirationSefrvice insadd = InspirationSefrvice();
  TextEditingController tag = TextEditingController();
  TextEditingController description = TextEditingController();
  List<String> tags = [];

  File? _image;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

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
          padding: EdgeInsets.only(left: 35),
          child: Text(
            'Add Inspiration ',
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
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 235, 255, 1),
                Color.fromRGBO(255, 217, 249, 1)
              ]),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Divider(color: Colors.black),
                _image != null
                    ? Image.file(
                        _image!,
                        height: 400,
                        width: 200,
                      )
                    : const SizedBox(
                        height: 400,
                        width: 300,
                        child: Center(
                          child: Text(
                            'No Image is Selected ',
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
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Add image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: description,
                    maxLength: 255,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      labelText: 'Enter the Description ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child:  TextField(
                    controller: tag,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      labelText: 'Enter the Tags ',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromRGBO(77, 43, 43, 1),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                    onPressed: () async {
                     
                      List<String> enteredTags = tag.text.split('#');


                      List<String> cleanedTags = enteredTags
                          .map((tag) => tag.trim())
                          .where((tag) => tag.isNotEmpty)
                          .toList();
                           insadd.addinspiratinserv(_image!, description.text.toString(), cleanedTags);
                          Get.to(()=>const InspirationW());
                       setState(() {
                         
                       });                      
                    },
                    child: const Text(
                      "Add Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 30,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
