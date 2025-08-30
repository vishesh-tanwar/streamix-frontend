import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/getreel_provider.dart';
import 'package:project/src/providers/likeOrDislike_provider.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
import 'package:project/src/utils/scale.dart';

class ShortsScreen extends ConsumerStatefulWidget {
  final bool showBackButton;
  final GetVideoModel? initialReel;
  const ShortsScreen({
    super.key,
    required this.showBackButton,
    this.initialReel,
  });

  @override
  ConsumerState<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends ConsumerState<ShortsScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Future.microtask(() {
      ref
          .read(getReelsProvider.notifier)
          .fetchReels(initialReel: widget.initialReel);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reelData = ref.watch(getReelsProvider);
    final reelNotifier = ref.read(getReelsProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: reelData.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                itemCount: reelData.length + (reelNotifier.isFetching ? 1 : 0),
                onPageChanged: (index) {
                  if (index >= reelData.length - 1) {
                    reelNotifier.fetchReels(loadMore: true);
                  }
                },
                itemBuilder: (context, index) {
                  if (index == reelData.length) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                  final currentReel = reelData[index];
                  return Stack(
                    children: [
                      ReusableVideoPlayer(videoUrl: reelData[index].video),
                      _buildOverlayControls(currentReel),
                      _buildTopBar(),
                      Positioned(
                        top: widget.showBackButton
                            ? Scale.screenHeight * 0.8
                            : Scale.screenHeight * 0.75,
                        left: 12.toScale,
                        child: _buildChannelInfo(reelData[index]),
                      ),
                      Positioned(
                        top: widget.showBackButton
                            ? Scale.screenHeight * 0.85
                            : Scale.screenHeight * 0.8,
                        child: _buildDescription(reelData[index]),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  Widget _buildOverlayControls(GetVideoModel reel) {
    return Positioned(
      right: 12.toScale,
      bottom: 100.toScale,
      child: Column(
        children: [
          _buildIconWithLabel(Icons.thumb_up, Strings.like, () {
            ref
                .read(likeOrDislikeProvider.notifier)
                .likeVideo(reel.id, reel.videoId);
          }),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.thumb_down, Strings.dislike, () {
            ref
                .read(likeOrDislikeProvider.notifier)
                .dislikeVideo(reel.id, reel.videoId);
          }),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.comment, Strings.comment, () {}),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.share, Strings.share, () {}),
        ],
      ),
    );
  }

  Widget _buildIconWithLabel(IconData icon, String label, VoidCallback onTap) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: label == "Like" && ref.watch(likeProvider)
                ? Colors.blue
                : label == "Dislike" && ref.watch(dislikeProvider)
                    ? Colors.blue
                    : Colors.white,
            size: 30.toScale,
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 12.toScale),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.toScale),
        height: Scale.screenHeight * 0.05,
        color: const Color.fromARGB(0, 255, 255, 255),
        child: Row(
          children: [
            if (widget.showBackButton)
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              )
            else
              SizedBox(width: Scale.screenWidth * 0.64),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChannelInfo(GetVideoModel reel) {
    return Row(
      children: [
        Container(
          width: Scale.screenWidth * 0.11,
          height: Scale.screenHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.toScale),
            image: DecorationImage(
              image: NetworkImage(reel.photo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: Scale.screenWidth * 0.02),
        Text(
          reel.handle,
          style: const TextStyle(color: Colors.white),
        ),
        SizedBox(width: Scale.screenWidth * 0.02),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize:
                Size(Scale.screenWidth * 0.02, Scale.screenHeight * 0.03),
            padding: EdgeInsets.symmetric(
                horizontal: 10.toScale, vertical: 5.toScale),
          ),
          onPressed: () {},
          child: const Text(
            Strings.subscribe,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _buildDescription(GetVideoModel reel) {
    return Container(
      width: Scale.screenWidth * 0.98,
      padding: EdgeInsets.all(10.toScale),
      child: Text(
        reel.title,
        maxLines: 2,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
