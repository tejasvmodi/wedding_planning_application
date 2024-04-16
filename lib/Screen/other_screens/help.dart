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
      'title': 'What is a wedding planner app?',
      'data':
          'A wedding planner app is a digital tool designed to help users plan and organize their weddings efficiently.'
    },
    {
      'title': 'What features does the wedding planner app offer?',
      'data':
          'The app typically offers features such as budget management, vendor management, checklist creation, wedding day timeline and much more.'
    },
    {
      'title': 'Is the wedding planner app free to use?',
      'data': 'Yes it is absolutely free for consumers.',
    },
    {
      'title':
          'Can I collaborate with my partner or wedding planner through the app?',
      'data': 'No, but you can see their progress on each step.'
    },
    {
      'title': 'Do you have monthly and yearly billing options?',
      'data':
          'Vestibulum faucibus lectus eget augue pharetra, quis semper lectus gravida. Vestibulum pretium in elit sed iaculis. Curabitur elementum turpis at ipsum molestie, id maximus odio tincidunt. Praesent id lacinia orci. Phasellus at varius arcu. Ut nec lobortis velit.'
    },
    {
      'title': 'Does the app provide vendor recommendations?',
      'data':
          'Yes, wedding planner app offers vendor directories or recommendations based on location, budget, and user reviews to help users find and hire wedding vendors such as photographers, florists, and caterers.'
    },
    {
      'title':
          'Some Other Questions What support options are available if I have questions or issues with the app?',
      'data':
          'wedding planner app offers customer support through email, chat, or FAQs within the app to assist users with any questions or technical issues they may encounter.'
    },
  ];


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
                        onTap: () => launchUrl(Uri.parse(
                            'https://youtu.be/JtKjcyc5wh0?si=bFciwnMu3zY3V-f0')),
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
                        onTap: () => launchUrl(Uri.parse(
                            'https://youtu.be/guHHhEUYAQ4?si=5qRpnjro5WyBGAcD')),
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
                        onTap: () => launchUrl(Uri.parse(
                            'https://youtu.be/v941giGV-Tg?si=kCQvm1wWRtlzD6Vx')),
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
// Future<void> _launchYouTubeVideo(BuildContext context, String url) async {
//   // 1. Check if the URL can be launched
//   if (await canLaunch(url)) {
//     // 2. Launch the URL
//     await launch(url);
//   } else {
//     // 3. Show an error snackbar if launching fails
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Could not launch YouTube video'),
//       ),
//     );
//   }
// }
