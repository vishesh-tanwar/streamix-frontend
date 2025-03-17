// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/models/video.dart';

final getReelsProvider =
    StateNotifierProvider<GetReelsNotifier, List<GetVideoModel>>((ref) {
  return GetReelsNotifier();
});

class GetReelsNotifier extends StateNotifier<List<GetVideoModel>> {
  GetReelsNotifier() : super([]);

  int _currentPage = 0;
  bool isFetching = false;
  bool _hasMore = true;

  Future<void> fetchReels(
      {bool loadMore = false, GetVideoModel? initialReel}) async {
    if (isFetching || (!_hasMore && loadMore)) return;

    isFetching = true;

    try {
      if (!loadMore) {
        _currentPage = 0;
        state = [];
      }

      final response = await Dio().get(
          'http://192.168.1.30:3000/api/controllers/allreels?page=$_currentPage');

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("reels")) {
          List<GetVideoModel> videos = (responseData["reels"] as List)
              .map((video) =>
                  GetVideoModel.fromJson(video as Map<String, dynamic>))
              .toList();

          if (loadMore) {
            state = [...state, ...videos];
          } else {
            state = videos;
          }

          if (initialReel != null) {
            setInitialReel(initialReel);
          }

          _hasMore = videos.length == 4;
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

  void setInitialReel(GetVideoModel initialReel) {
    List<GetVideoModel> updatedReels = state.toList();
    updatedReels.removeWhere((reel) => reel.videoId == initialReel.videoId);
    updatedReels.insert(0, initialReel);
    state = updatedReels;
  }
}
