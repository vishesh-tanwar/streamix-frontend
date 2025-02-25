import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/utils/scale.dart';
import 'package:video_player/video_player.dart';
import 'package:project/src/providers/video_player_provider.dart';

class ReusableVideoPlayer extends ConsumerWidget {
  final String videoUrl;

  const ReusableVideoPlayer({Key? key, required this.videoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoState = ref.watch(videoPlayerProvider(videoUrl));
    final videoController = videoState.videoController;

    if (videoController == null || !videoController.value.isInitialized) {
      return const Center(
          child: CircularProgressIndicator(color: Colors.white));
    }

    return GestureDetector(
      onTap: () =>
          ref.read(videoPlayerProvider(videoUrl).notifier).togglePlayback(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: VideoPlayer(videoController),
          ),
          AnimatedOpacity(
            opacity: videoState.showControlIcon ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: Icon(
              videoState.controlIcon,
              size: 80.toScale,
              color: Colors.white70,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child:
                VideoProgressIndicator(videoController, allowScrubbing: true),
          ),
        ],
      ),
    );
  }
}
