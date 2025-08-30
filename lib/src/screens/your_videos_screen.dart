import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/providers/get_my_videos.dart';
import 'package:project/src/screens/watch_video_screen.dart';
import 'package:project/src/widgets/video_card.dart';

class YourVideosScreen extends ConsumerWidget {
  const YourVideosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myVideos = ref.watch(getMyVideosProvider);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            "Your Videos",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              myVideos.isEmpty
                  ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.video_library_outlined,
                              color: Colors.white54,
                              size: 60,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "No videos uploaded yet",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Start uploading to see your videos here.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const Text(
                      "To Delete a video, long press on it",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Delete Video"),
                            content: const Text(
                                "Are you sure you want to delete this video?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  ref
                                      .read(getMyVideosProvider.notifier)
                                      .deleteVideo(myVideos[index].videoId);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete"),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WatchVideoScreen(
                                videoId: myVideos[index].videoId,
                              ),
                            ),
                          );
                        },
                        child: VideoCard(video: myVideos[index]),
                      );
                    },
                    itemCount: myVideos.length),
              ),
            ],
          ),
        ));
  }
}
