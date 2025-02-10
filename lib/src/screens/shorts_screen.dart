import 'package:flutter/material.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/reels.dart';
import 'package:project/src/widgets/reuse_video_player.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: reelData.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ReusableVideoPlayer(videoUrl: reelData[index].video),
                _buildOverlayControls(),
                _buildTopBar(),
                Positioned(
                  top: widget.showBackButton ? 650.toScale : 600.toScale,
                  left: 12.toScale,
                  child: _buildChannelInfo(reelData[index]),
                ),
                Positioned(
                  top: widget.showBackButton ? 700.toScale : 645.toScale,
                  child: _buildDescription(reelData[index]),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOverlayControls() {
    return Positioned(
      right: 12.toScale,
      bottom: 100.toScale,
      child: Column(
        children: [
          _buildIconWithLabel(Icons.thumb_up, Strings.like, () {}),
          const SizedBox(height: 12),
          _buildIconWithLabel(Icons.thumb_down, Strings.dislike, () {}),
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
            color: Colors.white,
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

  Widget _buildChannelInfo(Reels reel) {
    return Row(
      children: [
        Container(
          width: Scale.screenWidth * 0.11,
          height: Scale.screenHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.toScale),
            image: DecorationImage(
              image: AssetImage(reel.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: Scale.screenWidth * 0.02),
        Text(
          reel.channel,
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

  Widget _buildDescription(Reels reel) {
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
