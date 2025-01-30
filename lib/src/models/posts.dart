import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

class Posts {
  final String logo;
  final String name;
  final String paragraph;
  final List<String> images;
  final int likes;
  final int comments;

  Posts(
      {required this.logo,
      required this.name,
      required this.paragraph,
      required this.images,
      required this.likes,
      required this.comments});
}

List<Posts> postData = [
  Posts(
      logo: AppIcons.reel3,
      name: "Param ji Lamba",
      paragraph: Strings.paragraph,
      images: [
        AppIcons.reel2,
        AppIcons.reel,
        AppIcons.reel4,
      ],
      likes: 348,
      comments: 67)
];
