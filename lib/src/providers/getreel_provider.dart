import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/models/video.dart';

final getReelsProvider =
    StateNotifierProvider<GetReelsNotifier, List<GetVideoModel>>((ref) {
  return GetReelsNotifier();
});

class GetReelsNotifier extends StateNotifier<List<GetVideoModel>> {
  GetReelsNotifier() : super([]);

  Future<void> fetchReels() async {
    try {
      final response =
          await Dio().get('http://192.168.1.30:3000/api/controllers/allreels');

      if (response.statusCode == 200) {
        print(response.data);

        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("reels")) {
          List<GetVideoModel> videos = (responseData["reels"] as List)
              .map((video) =>
                  GetVideoModel.fromJson(video as Map<String, dynamic>))
              .toList();

          state = videos;
        } else {
          print("Unexpected response format: $responseData");
        }
      }
    } catch (e) {
      print('Error fetching videos: $e');
    }
  }
}
