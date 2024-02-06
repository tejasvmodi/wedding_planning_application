import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NotificationW extends StatefulWidget {
  const NotificationW({Key? key}) : super(key: key);

  @override
  State<NotificationW> createState() => _NotificationWState();
}

class _NotificationWState extends State<NotificationW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 217, 249, 1),
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
        title:  Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Color.fromRGBO(85, 32, 32, 1),
              fontFamily: 'EBGaramond',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              height: 1,
            ),
          ),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              MdiIcons.messageText,
              size: 40,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(color: Colors.black)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 5),
              notificationdesign(
                  'You have new notification from Wedding Planning Application',
                  'Vanues starting from 1 Laks'),
              const SizedBox(height: 5),
              notificationdesign(
                  'You have new notification from Wedding Planning Application',
                  'Vanues starting from 1 Laks'),
              const SizedBox(height: 5),
              notificationdesign(
                  'You have new notification from Wedding Planning Application',
                  'Vanues starting from 1 Laks'),
              const SizedBox(height: 5),
              notificationdesign(
                  'You have new notification from Wedding Planning Application',
                  'Vanues starting from 1 Laks'),
              const SizedBox(height: 5),
              notificationdesign(
                  'You have new notification from Wedding Planning Application',
                  'Vanues starting from 1 Laks'),
                  const SizedBox(height: 5),
              notificationdesign('You have new notification from Wedding Planning Application','Vanues starting from 1 Laks'),
          const SizedBox(height: 5),
              notificationdesign('You have new notification from Wedding Planning Application','Vanues starting from 1 Laks'),
          const SizedBox(height: 5),
              notificationdesign('You have new notification from Wedding Planning Application','Vanues starting from 1 Laks'),
          const SizedBox(height: 5),
              notificationdesign('You have new notification from Wedding Planning Application','Vanues starting from 1 Laks'),
          const SizedBox(height: 5),
              notificationdesign('You have new notification from Wedding Planning Application','Vanues starting from 1 Laks'),
          
            ],
          ),
        ),
      ),
    );
  }
}

Widget notificationdesign(String name, String descript) {
  return Container(
    height: 100,
    margin: const EdgeInsets.all(8),
    width: double.infinity,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(242, 187, 233, 1),
      border: Border(bottom: BorderSide(color:Colors.black12)),
      borderRadius: BorderRadius.circular(17),
      boxShadow: [BoxShadow(blurRadius: 5,spreadRadius: 2,color: Colors.black26)]
    ),
    child: Row(
      children: [
        Icon(MdiIcons.bellOutline, size: 50),
        const SizedBox(width: 8),
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
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
                children: [
                  TextSpan(
                    text: '$name\n',
                  ),
                  const WidgetSpan(
                    child: SizedBox(height: 25),
                  ),
                  TextSpan(
                    text: descript,
                    style: TextStyle(
                      fontSize: 20,
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
  );
}
