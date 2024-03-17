import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_planning_application/screen/chats/chat_message.dart';

class ChatInboxW extends StatefulWidget {
  const ChatInboxW({super.key});

  @override
  State<ChatInboxW> createState() => _ChatInboxWState();
}

class _ChatInboxWState extends State<ChatInboxW> {
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
          padding: EdgeInsets.only(left: 90),
          child: Text(
            'Chat',
            style: TextStyle(
              color: Color.fromRGBO(85, 32, 32, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic,
              height: 1,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black45)),
          gradient: LinearGradient(
              begin: Alignment(6.123234262925839e-17, 1),
              end: Alignment(-1, 6.123234262925839e-17),
              colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 231, 255, 1),
                Color.fromRGBO(255, 219, 249, 1),
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              chatListDesign('Rohan Patel', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_1.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Aisha Khan', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_2.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Maya Singh', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_3.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Natasha Malik', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_4.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Simran Choudhary', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_5.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Arjun Singh', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_6.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Naina Shah', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_7.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Anaya Ahmed', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_1.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Riya Desai', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_2.jpg'),
              const SizedBox(height: 10),
              chatListDesign('Amara Khan', 'Venue Starting from 1 Lakhs',
                  'Venue Provider', 'chat_avatar_3.jpg'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

chatListDesign(String name, String descript, String value, String imagelink) {
  return InkWell(
    child: Container(
      height: 80,
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 187, 233, 1),
          border: const Border(bottom: BorderSide(color: Colors.black12)),
          borderRadius: BorderRadius.circular(17),
          boxShadow: const [
            BoxShadow(blurRadius: 5, spreadRadius: 2, color: Colors.black26)
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
                image: DecorationImage(
                    image: AssetImage('assets/images/$imagelink'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 180,
              ),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Color.fromRGBO(104, 74, 74, 1),
                    fontFamily: 'EBGaramond',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: '$name  |  $value\n',
                    ),
                    const WidgetSpan(
                      child: SizedBox(height: 25),
                    ),
                    TextSpan(
                      text: descript,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Get.to(() => ChatMessageW(
            image: imagelink,
            name: name,
          ));
    },
  );
}
