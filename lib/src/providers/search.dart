import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/video.dart';

final SearchProvider = StateNotifierProvider<searchNotifier,List<GetVideoModel>>((ref)=>
 searchNotifier());

class searchNotifier extends StateNotifier<List<GetVideoModel>>{
  searchNotifier() : super([]);
  TextEditingController searchController = TextEditingController();
  var isFetching = false;
  Future<void> searchApi(String keyword) async {
    final query = '${Strings.url}/api/controllers/search?keywords=$keyword';
    try {
      isFetching = true ;
      final response = await Dio().get(query);
      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData is Map<String, dynamic> && responseData.containsKey('videos')) {
          List<GetVideoModel> videos = (responseData['videos'] as List)
              .map((video) => GetVideoModel.fromJson(video))
              .toList();
          state = videos;
          isFetching = false;
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
      isFetching = false ;
    }
  }
}