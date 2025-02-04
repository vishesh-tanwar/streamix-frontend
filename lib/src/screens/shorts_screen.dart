import 'package:flutter/material.dart';
import 'package:project/src/models/reels.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
// import 'package:video_player/video_player.dart';
import 'package:project/src/utils/scale.dart';

class ShortsScreen extends StatefulWidget {
  final bool showBackButton;

  const ShortsScreen({
    Key? key,
    required this.showBackButton,
  }) : super(key: key);

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  // late PageController _pageController;
  // VideoPlayerController? _currentController;
  // int _currentIndex = 0;
  // bool _showControlIcon = false; // for pause and play functionality
  // IconData _controlIcon = Icons.pause; // for pause and play functionality

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  //   _initializeVideo(_currentIndex);
  // }

  // void _initializeVideo(int index) {
  //   _disposeCurrentController();
  //   _currentController =
  //       VideoPlayerController.networkUrl(Uri.parse(reelData[index].video))
  //         ..initialize().then((_) {
  //           setState(() {});
  //           _currentController?.setLooping(true);
  //           _currentController?.play();
  //         });
  // }

  // void _disposeCurrentController() {
  //   _currentController?.pause();
  //   _currentController?.dispose();
  //   _currentController = null;
  // }

  // @override
  // void dispose() {
  //   _disposeCurrentController();
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          // controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: reelData.length,
          // onPageChanged: (index) {
          //   setState(() {
          //     _currentIndex = index;
          //     _initializeVideo(index);
          //   });
          // },
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ReusableVideoPlayer(videoUrl: reelData[index].video),
                _buildOverlayControls(),
                _buildTopBar(),
                Positioned(
                  top: widget.showBackButton ? 600 : 560,
                  left: 12,
                  child: _buildChannelInfo(reelData[index]),
                ),
                Positioned(
                  top: widget.showBackButton ? 650 : 600,
                  child: _buildDescription(reelData[index]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Widget _buildVideoPlayer() {
  //   return GestureDetector(
  //     onTap: _toggleVideoPlayback,
  //     child: Stack(
  //       alignment: Alignment.center,
  //       children: [
  //         _currentController != null && _currentController!.value.isInitialized
  //             ? Center(
  //                 child: AspectRatio(
  //                   aspectRatio: _currentController!.value.aspectRatio,
  //                   child: VideoPlayer(_currentController!),
  //                 ),
  //               )
  //             : const Center(
  //                 child: CircularProgressIndicator(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //         if (_showControlIcon)
  //           AnimatedOpacity(
  //             opacity: _showControlIcon ? 1.0 : 0.0,
  //             duration: const Duration(milliseconds: 100),
  //             child: Icon(
  //               _controlIcon,
  //               size: 80,
  //               color: Colors.white70,
  //             ),
  //           ),
  //       ],
  //     ),
  //   );
  // }

  // void _toggleVideoPlayback() {
  //   if (_currentController != null) {
  //     setState(() {
  //       if (_currentController!.value.isPlaying) {
  //         _currentController?.pause();
  //         _controlIcon = Icons.play_arrow;
  //       } else {
  //         _currentController?.play();
  //         _controlIcon = Icons.pause;
  //       }
  //       _showControlIcon = true;
  //     });

  //     // Hide the control icon after 2 seconds
  //     Future.delayed(const Duration(seconds: 1), () {
  //       setState(() {
  //         _showControlIcon = false;
  //       });
  //     });
  //   }
  // }

  Widget _buildOverlayControls() {
    return Positioned(
      right: 12,
      bottom: 100,
      child: Column(
        children: [
          _buildIconWithLabel(Icons.thumb_up, "Like", () {}),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.thumb_down, "Dislike", () {}),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.comment, "Comment", () {}),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.share, "Share", () {}),
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
            color: Colors.white,
            size: 30,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 12),
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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 70,
        color: Colors.transparent,
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
              const SizedBox(width: 48),
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

  Widget _buildChannelInfo(Reels reel) {
    return Row(
      children: [
        Container(
          width: Scale.screenWidth * 0.11,
          height: Scale.screenHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
              image: AssetImage(reel.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          reel.channel,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: const Size(50, 30),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          ),
          onPressed: () {},
          child: const Text(
            "Subscribe",
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        )
      ],
    );
  }

  Widget _buildDescription(Reels reel) {
    return Container(
      width: 370,
      padding: const EdgeInsets.all(10),
      child: Text(
        reel.title,
        maxLines: 2,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
