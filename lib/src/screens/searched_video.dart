import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/providers/history_provider.dart';
import 'package:project/src/providers/search.dart';
import 'package:project/src/widgets/video_card.dart';
import 'package:project/src/screens/watch_video_screen.dart';

class SearchedVideo extends ConsumerWidget {
  const SearchedVideo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prod = ref.read(SearchProvider.notifier);
    var videoData = ref.watch(SearchProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leadingWidth: 30,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            prod.searchController.text = '';
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => prod.searchApi(prod.searchController.text),
            color: Colors.white,
          )
        ],
        title: TextField(
          controller: prod.searchController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[800],
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ),
      body: prod.isFetching
    ? Container()
    : ListView.builder(
            itemCount: videoData.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () {
                ref.read(historyProvider.notifier).sendToHistory(videoData[i]);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WatchVideoScreen(videoId: videoData[i].videoId),
                  ),
                );
              },
              child: VideoCard(video: videoData[i]),
            ),
          ),
    );
  }
}
