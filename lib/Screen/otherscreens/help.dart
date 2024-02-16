import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpW extends StatefulWidget {
  const HelpW({super.key});

  @override
  State<HelpW> createState() => _HelpWState();
}

class _HelpWState extends State<HelpW> {
  final List<Map<String, dynamic>> _items = [
    {
      'title': 'How to Use this Application?',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
    {
      'title': 'How can i remove my account?',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
    {
      'title':
          'What kind of support is available if I encounter issues or have specific questions about the app ?',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
    {
      'title': 'Some Other Questions ?',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
    {
      'title': 'Some Other Questions ? ',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
    {
      'title': 'Some Other Questions ?',
      'data':
          'The app is Designed as simple as possible to use, there are many services like vendors checklist, and inspiration section, you can play for a while and get familiar.'
    },
  ];

  final String videoUrl = 'https://youtu.be/x9l2VRJ5-3k?si=IH-Cx46hJIm1UXZh';

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
              'Help ',
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
        ),
        backgroundColor: const Color.fromRGBO(255, 217, 249, 1),
        body: Container(
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black))),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'EBGaramond',
                    fontSize: 20,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(40, 15, 15, 1),
                      hintText: 'How can we help you?',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'EBGaramond',
                        fontSize: 20,
                        letterSpacing: 0,  
                        fontWeight: FontWeight.bold,
                        height: 1,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(9, 9)))),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
                child: const Text('Suggested Videos',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 66, 66, 1),
                      fontFamily: 'EBGaramond',
                      fontSize: 24,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () => _launchYouTubeVideo(context, 'https://youtu.be/x9l2VRJ5-3k?si=IH-Cx46hJIm1UXZh'),
                        child: Container(
                          height: 160,
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(23, 23)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/help_1.jpg'),
                                  fit: BoxFit.cover)),
                          child: Icon(
                            MdiIcons.playCircleOutline,
                            color: Colors.black87,
                            size: 60,
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () => _launchYouTubeVideo(context, 'https://youtu.be/DsROfrRB-1k?si=DvmKorCh11JfHTVw'),
                        child: Container(
                          height: 160,
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(23, 23)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/help_2.jpg'),
                                  fit: BoxFit.cover)),
                          child: Icon(
                            MdiIcons.playCircleOutline,
                            color: Colors.black87,
                            size: 60,
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () => _launchYouTubeVideo(context, 'https://youtu.be/tyBJioe8gOs?si=DZUd5e5bSE7H-MUc'),
                        child: Container(
                          height: 160,
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: const BorderRadius.all(
                                  Radius.elliptical(23, 23)),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/help_3.jpg'),
                                  fit: BoxFit.cover)),
                          child: Icon(
                            MdiIcons.playCircleOutline,
                            color: Colors.black87,
                            size: 60,
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 20),
                alignment: Alignment.centerLeft,
                child: const SizedBox(
                  height: 40,
                  child: Text('Frequently Asked Questions',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 66, 66, 1),
                        fontFamily: 'EBGaramond',
                        fontSize: 24,
                        letterSpacing: 0,
                        fontWeight: FontWeight.bold,
                        height: 1,
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (_, index) {
                        final item = _items[index];
                        return Card(
                          // key: PageStorageKey(item['id']),

                          elevation: 4,
                          child: ExpansionTile(
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(12, 12))),
                              backgroundColor:
                                  const Color.fromRGBO(239, 226, 239, 1),
                              iconColor: const Color.fromRGBO(96, 66, 66, 1),
                              tilePadding: const EdgeInsets.all(5),
                              collapsedIconColor:
                                  const Color.fromRGBO(96, 66, 66, 1),
                              childrenPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.end,
                              title: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item["title"],
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(96, 66, 66, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    height: 1,
                                  ),
                                ),
                              ),
                              children: [
                                Text(
                                  item['data'],
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(96, 66, 66, 1),
                                    fontFamily: 'EBGaramond',
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                                
                                // This button is used to remove this item
                              ]),
                        );
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}

Future<void> _launchYouTubeVideo(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not launch YouTube video'),
      ),
    );
  }
}
