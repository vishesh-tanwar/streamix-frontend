// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final getMyVideosProvider =
    StateNotifierProvider<getMyVideoNotifier, List<GetVideoModel>>((ref) {
  return getMyVideoNotifier(ref);
});

// ignore: camel_case_types
class getMyVideoNotifier extends StateNotifier<List<GetVideoModel>> {
  final Ref ref;
  getMyVideoNotifier(this.ref) : super([]);

  Future<void> fetchMyVideos() async {
    final user = ref.read(userProvider);
    final url = '${Strings.url}/api/controllers/yourVideos?userId=${user.id}';

    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        print('Data received: ${response.data}');

        final data = response.data;
        if (data['result'] != null) {
          final List<dynamic> result = data['result'];
          final List<GetVideoModel> videoList = result.map((json) {
            final enrichedJson = {
              ...(json as Map<String, dynamic>),
              'photo': user.photo,
              'name': user.name,
              'handle': user.handle,
            };
            return GetVideoModel.fromJson(enrichedJson);
          }).toList();

          state = videoList;
          print('Videos updated successfully.');
        } else {
          state = [];
          print('No videos found.');
        }
      } else {
        print('Error fetching videos: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching my videos: $e');
    }
  }

  Future<void> deleteVideo(int videoId) async {
    print(videoId);
    final url = '${Strings.url}/api/controllers/deleteVideo?videoId=$videoId';
    try {
      final response = await Dio().post(url);

      if (response.statusCode == 200) {
        print('Video deleted successfully');
        fetchMyVideos();
      } else {
        print('Error deleting video: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting video: $e');
    }
  }
}
