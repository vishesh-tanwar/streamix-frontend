import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final videoPlayerProvider =
    StateNotifierProvider.family<VideoPlayerNotifier, VideoPlayerState, String>(
  (ref, videoUrl) => VideoPlayerNotifier(videoUrl),
);

class VideoPlayerNotifier extends StateNotifier<VideoPlayerState> {
  VideoPlayerNotifier(String videoUrl)
      : super(VideoPlayerState(videoController: null)) {
    _initialize(videoUrl);
  }

  Future<void> _initialize(String videoUrl) async {
    // Dispose of the previous video before initializing a new one
    if (state.videoController != null) {
      await state.videoController?.pause();
      await state.videoController?.dispose();
    }

    final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: false,
          allowBackgroundPlayback: false,
        ));

    await controller.initialize();

    // Ensure autoplay when switching videos
    controller.play();

    state = VideoPlayerState(
      videoController: controller,
      // controlIcon: Icons.pause, // Reset icon to "pause" since it's playing
      // showControlIcon: false, // Hide icon initially
    );
  }

  void togglePlayback() {
    final controller = state.videoController;
    if (controller == null) return;

    if (controller.value.isPlaying) {
      controller.pause();
      state = state.copyWith(
        controlIcon: Icons.play_arrow,
        showControlIcon: true,
      );
    } else {
      controller.play();
      state = state.copyWith(
        controlIcon: Icons.pause,
        showControlIcon: true,
      );
    }

    _hideControlIcon();
  }

  void _hideControlIcon() {
    Future.delayed(const Duration(seconds: 1), () {
      state = state.copyWith(showControlIcon: false);
    });
  }

  @override
  void dispose() {
    state.videoController?.pause();
    state.videoController?.dispose();
    super.dispose();
  }
}

// State class to hold video state
class VideoPlayerState {
  final VideoPlayerController? videoController;
  final bool showControlIcon;
  final IconData controlIcon;

  VideoPlayerState({
    required this.videoController,
    this.showControlIcon = false,
    this.controlIcon = Icons.pause,
  });

  VideoPlayerState copyWith({
    VideoPlayerController? videoController,
    bool? showControlIcon,
    IconData? controlIcon,
  }) {
    return VideoPlayerState(
      videoController: videoController ?? this.videoController,
      showControlIcon: showControlIcon ?? this.showControlIcon,
      controlIcon: controlIcon ?? this.controlIcon,
    );
  }
}
