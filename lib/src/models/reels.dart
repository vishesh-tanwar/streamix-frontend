import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

class Reels {
  final String thumbnail ;
  final String title ;

  Reels({
    required this.thumbnail,
    required this.title 
  });
}

List<Reels> reelData = [
  Reels(
    thumbnail: AppIcons.reel,
    title: Strings.reelTitle 
  ),
  Reels(thumbnail: AppIcons.reel2,title: Strings.reel2Title),
  Reels(thumbnail: AppIcons.reel3, title: Strings.reel3Title),
  Reels(thumbnail: AppIcons.reel4, title: Strings.reel4Title),
];

