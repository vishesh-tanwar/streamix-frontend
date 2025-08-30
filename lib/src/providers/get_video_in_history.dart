import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final getVideoInHistoryProvider =
    StateNotifierProvider<GetVideoInHistoryNotifier, List<GetVideoModel>>(
        (ref) {
  return GetVideoInHistoryNotifier(ref);
});

class GetVideoInHistoryNotifier extends StateNotifier<List<GetVideoModel>> {
  final Ref ref;
  GetVideoInHistoryNotifier(this.ref) : super([]);

  Future<void> getVideo(String videoId) async {
    final userId = ref.read(userProvider).id;
    final url =
        '${Strings.url}/api/controllers/getVideoInHistory?userId=$userId&videoId=$videoId';
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        final List<dynamic> result = response.data['result'];
        final List<GetVideoModel> videoList =
            result.map((json) => GetVideoModel.fromJson(json)).toList();
        state = videoList;
        print('Video fetched successfully! => $state');
      } else {
        print('Failed to fetch video: ${response.statusCode}');
      }
    } catch (e) {}
  }
}
