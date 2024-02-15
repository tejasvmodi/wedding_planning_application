// import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
                    color: Color.fromRGBO(96, 66, 66, 1),
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 160,
                      width: 190,
                      child: VideoPlayerWidget(
                        videoUrl:
                            'https://www.youtube.com/watch?v=tyBJioe8gOs', // Replace with your video URL
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 160,
                      width: 190,
                      child: VideoPlayerWidget(
                        videoUrl:
                            'https://www.youtube.com/watch?v=GBS6BXGAoAo', // Replace with your video URL
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 160,
                      width: 190,
                      child: VideoPlayerWidget(
                        videoUrl:
                            'https://www.youtube.com/watch?v=x9l2VRJ5-3k', // Replace with your video URL
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
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

//for youtube videos
class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl, super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: const YoutubePlayerFlags(autoPlay: false, loop: true),
    );
  }

  @override
  void dispose() {
    _youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.elliptical(8, 0)),
          boxShadow: const [BoxShadow(blurRadius: 4)]),
      child: YoutubePlayer(
        controller: _youtubeController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        aspectRatio: 16 / 9,
      ),
    );
  }
}

//for local videos 
// 
// 
// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;

//   const VideoPlayerWidget({required this.videoUrl, Key? key}) : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _videoPlayerController;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: true,
//       looping: true,
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Chewie(controller: _chewieController);
//   }
// }

