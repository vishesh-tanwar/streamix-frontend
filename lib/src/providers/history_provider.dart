// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final historyProvider =
    StateNotifierProvider<historyNotifier, GetVideoModel>((ref) {
  return historyNotifier(ref);
});

// ignore: camel_case_types
class historyNotifier extends StateNotifier<GetVideoModel> {
  final Ref ref;
  historyNotifier(this.ref)
      : super(GetVideoModel(
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
            totalLikes: -1,
            totalDislikes: -1,
            type: '',
            duration: ''));

  Future<void> sendToHistory(GetVideoModel videoData) async {
    final url = '${Strings.url}/api/controllers/history';
    final userId = ref.watch(userProvider).id;
    final dataToSend = videoData.toJson(user_id: userId);

    try {
      final response = await Dio().post(
        url,
        data: dataToSend,
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        print("Video sent to history successfully!");
      } else {
        print("Failed to send video to history: ${response.data}");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          print("Unauthorized: ${e.response?.data['message']}");
        } else {
          print("Dio error: ${e.message}");
        }
      } else {
        print("Error sending video to history: $e");
      }
    }
  }
}
