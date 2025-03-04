import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/providers/user_provider.dart';
import 'package:project/src/widgets/history_bar.dart';
import 'package:project/src/widgets/horizontal_button_list.dart';
import 'package:project/src/widgets/list_section.dart';
import 'package:project/src/widgets/playlist_bar.dart';
import 'package:project/src/widgets/profile_header.dart';
import '../models/history_data.dart';

class ProfileScreen extends ConsumerWidget {
  final List<IconData> barIcon = [
    AppIcons.you,
    AppIcons.g,
    AppIcons.hailOutlined,
    AppIcons.share,
  ];
  final List<String> barText = [
    Strings.switchAccount,
    Strings.googleAccount,
    Strings.turnOnIncognito,
    Strings.shareChannel
  ];

  final List<IconData> listIcon = [
    Icons.videocam_sharp,
    Icons.download,
    Icons.edit_outlined,
    Icons.bakery_dining_outlined,
    Icons.movie_creation_outlined,
    Icons.play_arrow_outlined,
    Icons.calendar_month_rounded,
    Icons.question_mark_rounded
  ];
  final List<String> listLabel = [
    Strings.yourVideos,
    Strings.download,
    Strings.yourCourses,
    Strings.badges,
    Strings.yourMovies,
    Strings.getYoutubePremium,
    Strings.timeWatched,
    Strings.helpAndFeedback
  ];

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);

    return userNotifier.currentUser != null
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cast, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings, color: Colors.white),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileHeader(),
                  HorizontalButtonList(barText: barText, barIcon: barIcon),
                  HistoryBar(),
                  PlaylistBar(historyItems: historyItems),
                  ListSection(label: listLabel, icon: listIcon)
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: Center(
                child: Text(
              "Please log in",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
          );
  }
}
