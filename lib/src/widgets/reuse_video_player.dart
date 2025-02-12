import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';
import 'package:video_player/video_player.dart';

class ReusableVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const ReusableVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  State<ReusableVideoPlayer> createState() => _ReusableVideoPlayerState();
}

class _ReusableVideoPlayerState extends State<ReusableVideoPlayer> {
  late VideoPlayerController _videoController;
  bool _showControlIcon = false;
  IconData _controlIcon = Icons.pause;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    _videoController.addListener(() {
      setState(() {});
    });
    _videoController.initialize().then((_) => setState(() {}));

    _videoController.play();
  }

  @override
  void dispose() {
    _videoController.pause();
    _videoController.dispose();
    super.dispose();
  }

  void _toggleVideoPlayback() {
    setState(() {
      if (_videoController.value.isPlaying) {
        _videoController.pause();
        _controlIcon = Icons.play_arrow;
      } else {
        _videoController.play();
        _controlIcon = Icons.pause;
      }
      _showControlIcon = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showControlIcon = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleVideoPlayback,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _videoController.value.isInitialized
              ? Center(
                  child: AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
          if (_showControlIcon)
            AnimatedOpacity(
              opacity: _showControlIcon ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                _controlIcon,
                size: 80.toScale,
                color: Colors.white70,
              ),
            ),
        ],
      ),
    );
  }
}
