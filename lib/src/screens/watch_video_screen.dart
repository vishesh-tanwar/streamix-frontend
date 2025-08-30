import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/components/bottom_bar.dart';
import 'package:project/src/components/watch_video_reel.dart';
import 'package:project/src/components/watch_video_slideBar.dart';
import 'package:project/src/providers/get_video_by_id_provider.dart';
import 'package:project/src/providers/getreel_provider.dart';
import 'package:project/src/providers/getvideo_provider.dart';
import 'package:project/src/widgets/description.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/video_card.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

final List<String> barText = [
  Strings.like,
  Strings.dislike,
];

final List<IconData> barIcon = [
  AppIcons.thumbsUp,
  AppIcons.thumbDown,
];

class WatchVideoScreen extends ConsumerStatefulWidget {
  // final GetVideoModel video;
  final int videoId;

  WatchVideoScreen({super.key, required this.videoId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WatchVideoScreenState();
}

class WatchVideoScreenState extends ConsumerState<WatchVideoScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(getVideoProvider.notifier).fetchVideos());
    Future.microtask(() => ref.read(getReelsProvider.notifier).fetchReels());
    Future.microtask(() => ref
        .read(getVideoByIdProvider.notifier)
        .getVideoById(videoId: widget.videoId));
  }

  @override
  Widget build(BuildContext context) {
    final videos = ref.watch(getVideoProvider);
    final videoData = ref.watch(getVideoByIdProvider);
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
                    SizedBox(
                      width: double.infinity,
                      height: Scale.screenHeight * 0.3,
                      child: ReusableVideoPlayer(videoUrl: videoData.video),
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
                                        video: videoData,
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      videoData.title,
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
                                          videoData.uploadedAt,
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
                                            image:
                                                NetworkImage(videoData.photo),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: Scale.screenWidth * 0.02),
                                      Text(
                                        videoData.name,
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
                              const SizedBox(height: 10),
                              WatchVideoSlidebar(),
                              const SizedBox(height: 10),
                            ],
                          ),
                          WatchVideoReel(),
                          ...List.generate(
                            videos.length,
                            (i) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WatchVideoScreen(videoId: videos[i].id),
                                  ),
                                );
                              },
                              child: VideoCard(video: videos[i]),
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
