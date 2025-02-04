import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

class Reels {
  final String thumbnail;
  final String title;
  final String video;
  final String channel;

  Reels(
      {required this.thumbnail,
      required this.title,
      required this.video,
      required this.channel});
}

List<Reels> reelData = [
  Reels(
    thumbnail: AppIcons.reel,
    title: Strings.reelTitle,
    channel: "@vilgaxx",
    video:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ),
  Reels(
      thumbnail: AppIcons.reel2,
      title: Strings.reel2Title,
      channel: "@algoIndia",
      video:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
  Reels(
      thumbnail: AppIcons.reel3,
      title: Strings.reel3Title,
      channel: "@natureBizzare",
      video:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
  Reels(
      thumbnail: AppIcons.reel4,
      title: Strings.reel4Title,
      channel: "@yummySnack",
      video:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
];
