import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatBubble extends StatelessWidget {
  final String sms;
  final bool isComing;
  final String time;
  final String status;
  final String imageurl;
  const ChatBubble(
      {super.key,
      required this.sms,
      required this.isComing,
      required this.time,
      required this.status,
      required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
          crossAxisAlignment:
              isComing ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(
                minWidth: 10,
                maxWidth: MediaQuery.sizeOf(context).width / 1.5,
              ),
              
              decoration:  BoxDecoration(
                
                border: Border.all(color: Colors.black38),
                color: const Color.fromRGBO(250, 204, 205, 0.8),
                  borderRadius: isComing ?
                   const BorderRadius.only(
                    bottomRight:  Radius.elliptical(25, 25),
                    topRight:  Radius.elliptical(25, 25),
                  ): const BorderRadius.only(
                    bottomLeft: Radius.elliptical(25, 25),
                    topLeft: Radius.elliptical(25, 25),
                  )
                  
                  ),
              child: imageurl == ''
                  ? Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(sms),
                  )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(imageurl)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(sms)
                      ],
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            isComing
                ? Text(
                    time,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                : Row(
                    mainAxisAlignment: isComing
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Text(
                        time,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Icon(
                        MdiIcons.checkAll,
                        size: 20,
                      )
                    ],
                  )
          ]),
    );
  }
}
