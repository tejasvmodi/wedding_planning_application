import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wedding_planning_application/services/core/updateinspiration.dart';

class Updateinspiration extends StatefulWidget {
  const Updateinspiration(
      {super.key,
      required this.index,
      required this.description,
      required this.image,
      required this.tag,
      required this.userid});
  final int index;
  final String description;
  final String image;
  final String tag;
  final int userid;

  @override
  State<Updateinspiration> createState() => _UpdateinspirationState();
}

class _UpdateinspirationState extends State<Updateinspiration> {
  UpdateinspirationService update = UpdateinspirationService();
  TextEditingController tag = TextEditingController();
  TextEditingController description = TextEditingController();
  List<String> tags = [];
  File? _image;
  bool ispress = true;
  @override
  void initState() {
    super.initState();
    tag.text = widget.tag;
    description.text = widget.description;
  }

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
            'Edit Inspiration ',
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
                    : Image.network(
                        widget.image,
                        height: 400,
                        width: 200,
                      ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('pick image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: description,
                    maxLength: 255,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      hintText: widget.description,
                      border: const OutlineInputBorder(
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
                  child: TextField(
                    controller: tag,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(85, 32, 32, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 15,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                      hintText: widget.tag, // Join without any separator
                      border: const OutlineInputBorder(
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
                if (ispress)
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
                      ispress = false;

                      List<String> enteredTags = tag.text.split('#');

                      List<String> cleanedTags = enteredTags
                          .map((tag) => tag.trim())
                          .where((tag) => tag.isNotEmpty)
                          .toList();

                      File imageFile = File(widget.image);
                      log(imageFile.toString());
                      if (_image != null) {
                        update.updateinspiration(
                          widget.index,
                          widget.description,
                          _image!,
                          cleanedTags,
                        );
                      } else {
                        update.updateinspiration(
                          widget.index,
                          widget.description,
                          imageFile,
                          cleanedTags,
                        );
                      }

                      setState(() {});
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: const Text('Success'),
                      //     content:
                      //         const Text('Inspiration Updated successfully.'),
                      //     actions: [
                      //       TextButton(
                      //         onPressed: () {
                      //           Navigator.of(context).pushReplacement(
                      //             MaterialPageRoute(
                      //               builder: (context) =>
                      //                   ScreenNavigation(currentIndex: 3),
                      //             ),
                      //           );
                      //         },
                      //         child: const Text('Done'),
                      //       ),
                      //     ],
                      //   ),
                      // );
                    },
                    child: const Text(
                      "Edit Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 30,
                        letterSpacing: 0,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                if (!ispress)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
