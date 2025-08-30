import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/providers/user_provider.dart';
import 'package:project/src/widgets/history_bar.dart';
import 'package:project/src/widgets/horizontal_button_list.dart';
import 'package:project/src/widgets/like_video_section.dart';
import 'package:project/src/widgets/list_section.dart';
// import 'package:project/src/widgets/playlist_bar.dart';
import 'package:project/src/widgets/profile_header.dart';
// import '../models/history_data.dart';

class ProfileScreen extends ConsumerWidget {
  final List<IconData> barIcon = [
    AppIcons.you,
  ];
  final List<String> barText = [
    Strings.switchAccount,
  ];

  final List<IconData> listIcon = [Icons.videocam_sharp];
  final List<String> listLabel = [
    Strings.yourVideos,
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
                  // PlaylistBar(historyItems: historyItems),
                  ListSection(label: listLabel, icon: listIcon),
                  LikeVideoSection()
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
