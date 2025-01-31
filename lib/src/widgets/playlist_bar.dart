import 'package:flutter/material.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/history_data.dart';
import 'package:project/src/utils/scale.dart';

class PlaylistBar extends StatelessWidget {
  final List<HistoryData> historyItems;

  const PlaylistBar({super.key, required this.historyItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                Strings.playlist,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.toScale),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 94, 92, 92)),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(Strings.viewAll,
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: Scale.screenHeight * 0.172,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: historyItems.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: Scale.screenWidth * 0.02),
              itemBuilder: (context, index) {
                final item = historyItems[index];
                final title = index == 0
                    ? Strings.likedVideos
                    : index == 1
                        ? Strings.watchLater
                        : item.title;
                final description = index < 2
                    ? Strings.private
                    : '${item.channelName} * ${Strings.playlist}';
                return _playlistItem(
                    item.thumbnailUrl, item.duration, title, description);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _playlistItem(
    String thumbnailUrl, String duration, String title, String description) {
  return SizedBox(
    width: 135,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                thumbnailUrl,
                height: 70,
                width: 132,
                fit: BoxFit.cover,
              ),
            ),
            if (title == Strings.likedVideos || title == Strings.watchLater)
              Positioned.fill(
                child: Container(
                  color: const Color.fromARGB(106, 0, 0, 0),
                ),
              ),
            if (title == Strings.likedVideos || title == Strings.watchLater)
              Positioned.fill(
                child: Center(
                  child: Icon(
                    title == Strings.likedVideos
                        ? Icons.thumb_up_sharp
                        : Icons.watch_later,
                    color: const Color.fromARGB(186, 255, 255, 255),
                    size: 25,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
        Text(
          description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey, fontSize: 11),
        ),
      ],
    ),
  );
}
