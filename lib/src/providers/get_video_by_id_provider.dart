import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';

final getVideoByIdProvider =
    StateNotifierProvider<getVideoByIdNotifier, GetVideoModel>((ref) {
  return getVideoByIdNotifier();
});

class getVideoByIdNotifier extends StateNotifier<GetVideoModel> {
  getVideoByIdNotifier()
      : super(GetVideoModel(
            videoId: -1,
            id: -1,
            video: "",
            thumbnail: "",
            title: "",
            description: "",
            type: "",
            totalLikes: -1,
            totalDislikes: -1,
            uploadedAt: "",
            photo: "",
            name: "",
            handle: "",
            duration: ""));

  Future<void> getVideoById({int videoId = -1}) async {
    try {
      final response = await Dio()
          .get('${Strings.url}/api/controllers/getVideoById?videoId=$videoId');

      if (response.statusCode == 200) {
        print('got video from id ================> ${response.data}');

        final responseData = response.data;
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("result")) {
          final resultList = responseData["result"];

          if (resultList is List && resultList.isNotEmpty) {
            state = GetVideoModel.fromJson(resultList.first);
          } else {
            print('Result list is empty or not valid.');
          }
        } else {
          print('Invalid response format: ${response.data}');
        }
      } else {
        print("Error fetching data: ${response.statusCode}");
      }
    } catch (e) {
      print('Exception in getVideoById: $e');
    }
  }
}
