import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/providers/get_liked_videos.dart';
import 'package:project/src/screens/watch_video_screen.dart';
import 'package:project/src/utils/scale.dart';

class LikeVideoSection extends ConsumerStatefulWidget {
  const LikeVideoSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => LikedVideosState();
}

class LikedVideosState extends ConsumerState {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(getLikedVideosProvider.notifier).fetchLikedVideos();
    }); // Fetch data once
  }

  @override
  Widget build(BuildContext context) {
    final likedVideos = ref.watch(getLikedVideosProvider);
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.thumb_up_sharp,
                    color: Colors.white,
                  ),
                  SizedBox(width: Scale.screenWidth * 0.02),
                  const Text(
                    "Liked Videos",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 94, 92, 92)),
                  ),
                ),
                onPressed: () {
                  // View All action
                },
                child: const Text(
                  Strings.viewAll,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: Scale.screenHeight * 0.008),
          SizedBox(
            height: Scale.screenHeight * 0.17,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: likedVideos.length,
              itemBuilder: (context, index) {
                final item = likedVideos[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchVideoScreen(
                            videoId: likedVideos[index].videoId),
                      ),
                    );
                  },
                  child: Container(
                    width: Scale.screenWidth * 0.37,
                    margin: const EdgeInsets.only(right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                '${Strings.url}${item.thumbnail}',
                                height: Scale.screenHeight * 0.09,
                                width: Scale.screenWidth * 0.36,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                                top: 55,
                                left: 95,
                                child: Container(
                                  width: Scale.screenWidth * 0.1,
                                  height: Scale.screenHeight * 0.025,
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(106, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Text(
                                      item.duration,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 11),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(height: Scale.screenHeight * 0.004),
                        Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
