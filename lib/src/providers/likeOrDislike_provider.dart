// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project/src/assets/strings.dart';
// import 'package:project/src/models/video.dart';
// import 'package:project/src/providers/user_provider.dart';

// final LikeOrDislikeProvider =
//     StateNotifierProvider<LikeOrDislikeNotifier, GetVideoModel>(
//   (ref) => LikeOrDislikeNotifier(ref),
// );

// class LikeOrDislikeNotifier extends StateNotifier<GetVideoModel> {
//   LikeOrDislikeNotifier(this.ref)
//       : super(GetVideoModel(
//           handle: "",
//           name: "",
//           photo: "",
//           uploadedAt: "",
//           description: "",
//           videoId: -1,
//           id: -1,
//           video: "",
//           thumbnail: "",
//           title: "",
//           totalLikes: -1,
//           totalDislikes: -1,
//           type: '',
//           duration: '',
//           hasLiked: false,
//           hasDisliked: false,
//         ));
//   final Ref ref;

//   Future<void> likeVideo(int videoId) async {
//     final user = ref.read(userProvider);
//     if (ref.watch(likeProvider) == false) {
//       final url =
//           '${Strings.url}/api/controllers/likeVideo?userId=${user.id}&videoId=$videoId';
//       try {
//         final response = await Dio().post(url);
//         if (response.statusCode == 200) {
//           state = state.copyWith(hasLiked: true);
//         } else {
//           print('Failed to like video: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Error liking video : $e');
//       }
//     } else {
//       // removeLike(videoId);
//     }
//   }

//   // void dislikeVideo(int videoId) {
//   //   if (ref.read(likeProvider).state) {
//   //     removeLike(videoId);
//   //   }
//   //   state = state.copyWith(dislikedVideos: [...state.dislikedVideos, videoId]);
//   // }

//   // void removeLike(int videoId) {
//   //   state = state.copyWith(
//   //     likedVideos: state.likedVideos.where((id) => id != videoId).toList(),
//   //   );
//   // }

//   // void removeDislike(int videoId) {
//   //   state = state.copyWith(
//   //     dislikedVideos:
//   //         state.dislikedVideos.where((id) => id != videoId).toList(),
//   //   );
//   // }
// }

// final likeProvider =
//     StateProvider((ref) => ref.watch(LikeOrDislikeProvider).hasLiked);
// final dislikeProvider =
//     StateProvider((ref) => ref.watch(LikeOrDislikeProvider).hasDisliked);

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/history_provider.dart';

final likeProvider =
    StateProvider<bool>((ref) => ref.watch(historyProvider).hasLiked!);
final dislikeProvider =
    StateProvider<bool>((ref) => ref.watch(historyProvider).hasDisliked!);

final likeOrDislikeProvider =
    StateNotifierProvider<LikeOrDislikeNotifier, GetVideoModel>(
  (ref) => LikeOrDislikeNotifier(ref),
);

class LikeOrDislikeNotifier extends StateNotifier<GetVideoModel> {
  LikeOrDislikeNotifier(this.ref)
      : super(
          GetVideoModel(
            handle: "",
            name: "",
            photo: "",
            uploadedAt: "",
            description: "",
            videoId: -1,
            id: -1,
            video: "",
            thumbnail: "",
            title: "",
            totalLikes: 0,
            totalDislikes: 0,
            type: '',
            duration: '',
            hasLiked: false,
            hasDisliked: false,
          ),
        );

  final Ref ref;

  void setVideo(GetVideoModel video) {
    state = video;
    ref.read(likeProvider.notifier).state = video.hasLiked!;
    ref.read(dislikeProvider.notifier).state = video.hasDisliked!;
  }

  Future<void> likeVideo(int userId, int videoId) async {
    final isAlreadyLiked = ref.watch(likeProvider);

    if (isAlreadyLiked == false) {
      final url =
          '${Strings.url}/api/controllers/likeVideo?userId=$userId&videoId=$videoId';

      try {
        final response = await Dio().post(url);

        if (response.statusCode == 200) {
          state = state.copyWith(
            hasLiked: true,
            hasDisliked: false,
            totalLikes: state.totalLikes + 1,
            totalDislikes: state.hasDisliked!
                ? state.totalDislikes - 1
                : state.totalDislikes,
          );

          ref.read(likeProvider.notifier).state = true;
          ref.read(dislikeProvider.notifier).state = false;
        }
      } catch (e) {
        print('Error liking video: $e');
      }
    }
  }

  Future<void> dislikeVideo(int userId, int videoId) async {
    final isAlreadyDisliked = ref.watch(dislikeProvider);

    if (isAlreadyDisliked == false) {
      final url =
          '${Strings.url}/api/controllers/dislikeVideo?userId=$userId&videoId=$videoId';

      try {
        final response = await Dio().post(url);

        if (response.statusCode == 200) {
          state = state.copyWith(
            hasDisliked: true,
            hasLiked: false,
            totalDislikes: state.totalDislikes + 1,
            totalLikes:
                state.hasLiked! ? state.totalLikes - 1 : state.totalLikes,
          );

          ref.read(dislikeProvider.notifier).state = true;
          ref.read(likeProvider.notifier).state = false;
        }
      } catch (e) {
        print('Error disliking video: $e');
      }
    }
  }
}
