import 'package:flutter/material.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/widgets/description.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/video_card.dart';

class WatchVideoScreen extends StatefulWidget {
  final Video video;

  WatchVideoScreen({super.key, required this.video});

  @override
  State<WatchVideoScreen> createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  // bool _showDescription = false ;

  final List<String> barText = [
    'Share',
    'Remix',
    'Thanks',
    'Stop ads',
    'Clip',
    'Save',
    'Report'
  ];

  final List<IconData> barIcon = [
    Icons.share,
    Icons.video_camera_back_rounded,
    Icons.money,
    Icons.stop_circle,
    Icons.logo_dev,
    Icons.save,
    Icons.flag
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Fixed video player
                Container(
                  width: double.infinity,
                  height: 202,
                  child: ReusableVideoPlayer(videoUrl: widget.video.link),
                ),
                SizedBox(
                  height: 15,
                ),
                // Scrollable content below the video
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(5),
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return Description(
                                    video: widget.video,
                                  );
                                },
                              );
                            },
                            child: Text(
                              widget.video.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '${widget.video.views} ${widget.video.uploadDate}  ',
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                "...more",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: Scale.screenWidth * 0.11,
                                    height: Scale.screenHeight * 0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image:
                                            AssetImage(widget.video.thumbnail),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    widget.video.channelName,
                                    style: const TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: const Size(50, 30),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "Subscribe",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.maxFinite,
                            height: Scale.screenHeight * 0.05,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: barText.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromARGB(255, 34, 34, 34),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.toScale),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Button action here
                                    },
                                    icon: Icon(
                                      barIcon[index],
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    label: Text(
                                      barText[index],
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              height: 80,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(255, 54, 54, 54),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Comments  0",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text(
                                        "No comments yet !!",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ...List.generate(
                        homeData.length,
                        (i) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WatchVideoScreen(video: homeData[i]),
                              ),
                            );
                          },
                          child: VideoCard(video: homeData[i]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
