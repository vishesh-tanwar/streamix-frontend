// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/models/video.dart';

final getVideoProvider =
    StateNotifierProvider<GetVideoNotifier, List<GetVideoModel>>((ref) {
  return GetVideoNotifier();
});

class GetVideoNotifier extends StateNotifier<List<GetVideoModel>> {
  GetVideoNotifier() : super([]);

  int _currentPage = 0;
  bool isFetching = false;
  bool _hasMore = true;

  Future<void> fetchVideos({bool loadMore = false}) async {
    if (isFetching || (!_hasMore && loadMore)) return;

    isFetching = true;

    try {
      if (!loadMore) {
        _currentPage = 0;
        state = [];
      }

      final response = await Dio().get(
          'http://192.168.1.30:3000/api/controllers/allvideos?page=$_currentPage');

      if (response.statusCode == 200) {
        print(response.data);

        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("videos")) {
          List<GetVideoModel> videos = (responseData["videos"] as List)
              .map((video) =>
                  GetVideoModel.fromJson(video as Map<String, dynamic>))
              .toList();

          if (loadMore) {
            state = [...state, ...videos];
          } else {
            state = videos;
          }

          _hasMore = videos.length == 2;
          if (_hasMore) _currentPage++;
        } else {
          print("Unexpected response format: $responseData");
        }
      }
    } catch (e) {
      print('Error fetching videos: $e');
    } finally {
      isFetching = false;
      state = [...state];
    }
  }
}
