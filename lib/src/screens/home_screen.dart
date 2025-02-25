import 'package:flutter/material.dart';
import 'package:project/src/models/posts.dart';
import 'package:project/src/screens/watch_video_screen.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/post.dart';
import 'package:project/src/widgets/reel_card.dart';
import '../components/sliver_app_bar.dart';
import '../components/drawer.dart';
import '../widgets/video_card.dart';
import '../models/video.dart';
import '../models/reels.dart';
import '../widgets/short_header.dart';
import '../assets/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  var category = [
    Strings.all,
    Strings.gaming,
    Strings.music,
    Strings.flutter,
    Strings.bosses,
    Strings.arcade
  ];

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  @override
  void initState() {
    Scale.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black,
        child: SafeArea(
            child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              categories: category,
              onDrawerTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.black,
                child: Column(
                  children: [
                    const ShortsHeader(),
                    SizedBox(
                      height: Scale.screenHeight * 0.014,
                    ),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        ...List.generate(
                            4, (i) => ReelCard(reels: reelData[i])),
                      ],
                    ),
                    PostCard(posts: postData[0]),
                    ...List.generate(
                      homeData.length,
                      (i) => GestureDetector(
                        onLongPress: () {
                          print("on long press");
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WatchVideoScreen(video: homeData[i]),
                            ),
                          );
                        },
                        child: VideoCard(video: homeData[i]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
