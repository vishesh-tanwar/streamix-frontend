import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/components/bottom_bar.dart';
import 'package:project/src/components/watch_video_comment.dart';
import 'package:project/src/components/watch_video_reel.dart';
import 'package:project/src/components/watch_video_slideBar.dart';
// import 'package:project/src/models/video.dart';
import 'package:project/src/providers/getvideo_provider.dart';
import 'package:project/src/widgets/description.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/video_card.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

final List<String> barText = [
  Strings.share,
  Strings.remix,
  Strings.thanks,
  Strings.stopAds,
  Strings.clip,
  Strings.save,
  Strings.report
];

final List<IconData> barIcon = [
  AppIcons.share,
  AppIcons.remix,
  AppIcons.money,
  AppIcons.stopCircle,
  AppIcons.clip,
  AppIcons.save,
  AppIcons.flag
];

class WatchVideoScreen extends ConsumerStatefulWidget {
  final GetVideoModel video;

  WatchVideoScreen({super.key, required this.video});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WatchVideoScreenState();
}

class WatchVideoScreenState extends ConsumerState<WatchVideoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(getVideoProvider.notifier).fetchVideos());
  }

  @override
  Widget build(BuildContext context) {
    final videoData = ref.watch(getVideoProvider);

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (b, r) async {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BottomBar()),
            (route) => false,
          );
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    // Fixed video player
                    Container(
                      width: double.infinity,
                      height: Scale.screenHeight * 0.3,
                      child: ReusableVideoPlayer(videoUrl: widget.video.video),
                    ),
                    SizedBox(
                      height: Scale.screenHeight * 0.01,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.video.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '${widget.video.uploadedAt}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12),
                                        ),
                                        Text(
                                          "...more",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: Scale.screenWidth * 0.11,
                                        height: Scale.screenHeight * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                widget.video.photo),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: Scale.screenWidth * 0.02),
                                      Text(
                                        widget.video.name,
                                        style: const TextStyle(
                                            color: Colors.white),
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
                                      Strings.subscribe,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              WatchVideoSlidebar(),
                              WatchVideoComment(),
                            ],
                          ),
                          WatchVideoReel(),
                          ...List.generate(
                            videoData.length,
                            (i) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WatchVideoScreen(video: videoData[i]),
                                  ),
                                );
                              },
                              child: VideoCard(video: videoData[i]),
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
        ));
  }
}
