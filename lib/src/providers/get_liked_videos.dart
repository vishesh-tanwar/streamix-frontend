// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final getLikedVideosProvider =
    StateNotifierProvider<getLikedVideosNotifier, List<GetVideoModel>>((ref) {
  return getLikedVideosNotifier(ref);
});

// ignore: camel_case_types
class getLikedVideosNotifier extends StateNotifier<List<GetVideoModel>> {
  final Ref ref;
  getLikedVideosNotifier(this.ref) : super([]);

  Future<void> fetchLikedVideos() async {
    final user = ref.read(userProvider);
    final url =
        '${Strings.url}/api/controllers/getLikedVideos?userId=${user.id}';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        final List<dynamic> result = response.data['result'];

        final List<GetVideoModel> likedVideoList =
            result.map((json) => GetVideoModel.fromJson(json)).toList();

        state = likedVideoList;
        print('Liked Videos fetched successfully! => $state');
      } else {
        print('Failed to fetch liked Videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching Liked Videos: $e');
    }
  }
}
