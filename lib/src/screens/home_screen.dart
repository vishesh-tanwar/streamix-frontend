import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project/src/models/posts.dart';
import 'package:project/src/providers/getreel_provider.dart';
import 'package:project/src/providers/history_provider.dart';
import 'package:project/src/screens/shorts_screen.dart';
import 'package:project/src/screens/watch_video_screen.dart';
import 'package:project/src/utils/scale.dart';
// import 'package:project/src/widgets/post.dart';
import 'package:project/src/widgets/reel_card.dart';
import '../components/sliver_app_bar.dart';
import '../components/drawer.dart';
import '../widgets/video_card.dart';
import '../widgets/short_header.dart';
import '../assets/strings.dart';
import '../providers/getvideo_provider.dart';

final GlobalKey<ScaffoldState> _homeScaffoldKey = GlobalKey<ScaffoldState>();

var category = [
  Strings.all,
  Strings.gaming,
  Strings.music,
  Strings.flutter,
  Strings.bosses,
  Strings.arcade
];

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(getVideoProvider.notifier).fetchVideos();
      ref.read(getReelsProvider.notifier).fetchReels();
    }); // Fetch data once
    scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 300) {
      ref.read(getVideoProvider.notifier).fetchVideos(loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoData = ref.watch(getVideoProvider);
    final reelData = ref.watch(getReelsProvider);

    return Scaffold(
      key: _homeScaffoldKey,
      drawer: MyDrawer(),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              CustomSliverAppBar(
                categories: category,
                onDrawerTap: () => _homeScaffoldKey.currentState?.openDrawer(),
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
                      reelData.isEmpty
                          ? CircularProgressIndicator()
                          : Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                ...List.generate(
                                  4,
                                  (i) => InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ShortsScreen(
                                                      showBackButton: true,
                                                      initialReel: reelData[i]),
                                            ));
                                      },
                                      child: ReelCard(
                                          reels: reelData[i], index: i)),
                                )
                              ],
                            ),
                      // PostCard(posts: postData[0]),
                      ...List.generate(
                        videoData.length,
                        (i) => GestureDetector(
                          onTap: () {
                            ref
                                .read(historyProvider.notifier)
                                .sendToHistory(videoData[i]);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WatchVideoScreen(
                                    videoId: videoData[i].videoId),
                              ),
                            );
                          },
                          child: VideoCard(video: videoData[i]),
                        ),
                      ),
                      ref.watch(getVideoProvider.notifier).isFetching
                          ? CircularProgressIndicator()
                          : SizedBox.shrink()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
