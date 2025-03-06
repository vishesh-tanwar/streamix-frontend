import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';
import '../assets/icons.dart';
import '../assets/strings.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  final List<String> titles = [
    Strings.trending,
    Strings.shopping,
    Strings.music,
    Strings.films,
    Strings.live,
    Strings.gaming,
    Strings.news,
    Strings.sport,
    Strings.courses,
    Strings.fashionAndBeauty,
    Strings.podcasts,
    Strings.youtubePremium,
    Strings.youtubeStudio,
    Strings.youtubeMusic,
    Strings.youtubeKids,
  ];

  final List<dynamic> icons = [
    AppIcons.trendingIcon,
    AppIcons.shoppingIcon,
    AppIcons.musicIcon,
    AppIcons.filmIcon,
    AppIcons.liveIcon,
    AppIcons.gamingIcon,
    AppIcons.newsIcon,
    AppIcons.sportIcon,
    AppIcons.coursesIcon,
    AppIcons.fashionIcon,
    AppIcons.podcastsIcon,
    AppIcons.youtubeLogoImage,
    AppIcons.youtubeStudioIcon,
    AppIcons.youtubeMusicIcon,
    AppIcons.youtubeKidsIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Scale.screenWidth * 0.64,
      color: const Color.fromARGB(255, 34, 34, 34),
      child: Column(
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 18.0, 6.0, 3.0),
            child: SizedBox(
              height: Scale.screenHeight * 0.09,
              child: Row(
                children: [
                  Image.asset(
                    AppIcons.youtubeLogoImage,
                    height: Scale.screenHeight * 0.05,
                  ),
                  SizedBox(width: Scale.screenHeight * 0.0001),
                  const Text(
                    Strings.youtube,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: titles.length + 1,
              separatorBuilder: (context, index) {
                // Add divider after the first 11 items
                if (index == 10) {
                  return const Divider(
                    color: Color.fromARGB(255, 75, 72, 72),
                    thickness: 2,
                  );
                }
                return const SizedBox.shrink();
              },
              itemBuilder: (context, index) {
                if (index == titles.length) {
                  // Footer Section
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        Strings.privacyPolicyTerms,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                  );
                }
                // Handle list tiles
                return ListTile(
                  leading: icons[index] is IconData
                      ? Icon(
                          icons[index],
                          color: index > 10 ? Colors.red : Colors.white,
                        )
                      : Transform.translate(
                          offset: const Offset(-6.6, 0.0),
                          child: Image.asset(
                            icons[index],
                            height: Scale.screenHeight * 0.034,
                          ),
                        ),
                  title: Text(
                    titles[index],
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${titles[index]} tapped")),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
