import 'package:flutter/material.dart';
import 'package:project/src/widgets/reel_card.dart';
import '../components/sliver_app_bar.dart';
import '../components/bottom_bar.dart';
import '../components/drawer.dart';
import '../widgets/video_card.dart';
import '../models/video.dart';
import '../models/reels.dart';
import '../widgets/short_header.dart'; // Import the ShortsHeader widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var category = [
    "All",
    "Gaming",
    "Music",
    "Flutter",
    "Bosses",
    "Arcade games"
  ];

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black, // Set background color to black
        child: SafeArea(
          child: Builder(
            builder: (BuildContext scaffoldContext) {
              return CustomScrollView(
                slivers: [
                  CustomSliverAppBar(
                    categories: category,
                    onDrawerTap: () => openDrawer(scaffoldContext),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          const ShortsHeader(), // Use the custom widget here
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: reelData.map((reel) {
                              return ReelCard(
                                reels: reel,
                              );
                            }).toList(),
                          ),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: homeData.map((video) {
                              return VideoCard(
                                  video: video); // Use the custom widget
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
