import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wedding_planning_application/screen/chats/components/chat_bubble.dart';

class ChatMessageW extends StatefulWidget {
  const ChatMessageW({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  State<ChatMessageW> createState() => _ChatMessageWState();
}

class _ChatMessageWState extends State<ChatMessageW> {
  final TextEditingController _newController = TextEditingController();
  final List<ChatBubble> _chatMessages = [
    const ChatBubble(
      imageurl: 'assets/images/inspiration_feed_dress_5.jpg',
      isComing: false,
      sms: 'which kind of bridal wears your shop provide ?',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Hii',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Bridal Lehengas',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Wedding Gowns',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Silk Sarees',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Trouseau Sarees',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: false,
      sms: 'can you send me some photos ?',
      status: 'read',
      time: "10:10 AM",
    ),
    const ChatBubble(
      imageurl: '',
      isComing: true,
      sms: 'Yaah! sure ..',
      status: 'read',
      time: "10:10 AM",
    ),
  ];
  bool _isselected = false;
  File? selectedIMage;
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
    });
    // Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
    });
    Navigator.of(context).pop();
  }

  Future uploadImage() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 217, 249, 0.8),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/${widget.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name),
                Text(
                  'online',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          border:
              Border.symmetric(horizontal: BorderSide(color: Colors.black26)),
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 235, 255, 0.5),
                Color.fromRGBO(255, 217, 249, 0.8),
              ]),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 50),
        child: ListView(
          children: _chatMessages,
        ),
      ),
      bottomSheet: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black)),
          borderRadius: BorderRadius.only(
              topRight: Radius.elliptical(23, 23),
              topLeft: Radius.elliptical(23, 23)),
          color: Color.fromRGBO(215, 187, 187, 1),
        ),
        height: 70,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _pickImageFromGallery();
                  _isselected = true;
                  setState(() {});
                },
                icon: Icon(MdiIcons.plusCircleOutline, size: 30),
              ),
              Expanded(
                child: TextField(
                  controller: _newController,
                  decoration: const InputDecoration(
                    filled: false,
                    hintText: 'type message',
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  _isselected
                      ? _chatMessages.add(
                          const ChatBubble(
                            imageurl: 'assets/images/Ceremoney.jpg',
                            isComing: false,
                            sms: '',
                            status: 'read',
                            time: "10:10 AM",
                          ),
                        )
                      :
                      // Add the new message to the list
                      _chatMessages.add(
                          ChatBubble(
                            imageurl: '',
                            isComing: false,
                            sms: _newController.text,
                            status: 'read',
                            time: "10:10 AM",
                          ),
                        );
                  // Clear the text field after sending
                  _newController.clear();
                  // Update the UI
                  setState(() {});
                },
                icon: Icon(MdiIcons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
