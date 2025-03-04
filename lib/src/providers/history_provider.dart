import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/providers/user_provider.dart';

final historyProvider =
    StateNotifierProvider<historyNotifier, GetVideoModel>((ref) {
  return historyNotifier(ref);
});

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
        ));

  Future<void> sendToHistory(GetVideoModel videoData) async {
    final url = 'http://192.168.1.30:3000/api/controllers/history';
    final user = ref.watch(userProvider);
    final userId = user.id;
    print('user id --------------------------------> $userId');
    final dataToSend = videoData.toJson(user_id: userId);

    print("Sending data: $dataToSend");

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
      print("Error sending video to history: $e");
    }
  }
}
