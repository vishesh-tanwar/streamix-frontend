// import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';

final getVideoProvider =
    StateNotifierProvider<GetVideoNotifier, List<GetVideoModel>>((ref) {
  return GetVideoNotifier();
});

class GetVideoNotifier extends StateNotifier<List<GetVideoModel>> {
  GetVideoNotifier() : super([]);

  Future<void> fetchVideos() async {
    try {
      final response =
          await Dio().get('http://192.168.1.30:3000/api/controllers/allvideos');

      if (response.statusCode == 200) {
        print(response.data);

        final responseData = response.data;

        if (responseData is Map<String, dynamic> &&
            responseData.containsKey("videos")) {
          List<GetVideoModel> videos = (responseData["videos"] as List)
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

class GetVideoModel {
  final int videoId;
  final int id;
  final String video;
  final String thumbnail;
  final String title;
  final String description;
  final String type;
  final String totalLikes;
  final String totalDislikes;
  final String uploadedAt;
  final String photo;
  final String name;

  GetVideoModel({
    required this.videoId,
    required this.id,
    required this.video,
    required this.thumbnail,
    required this.title,
    required this.description,
    required this.type,
    required this.totalLikes,
    required this.totalDislikes,
    required this.uploadedAt,
    required this.photo,
    required this.name,
  });

  factory GetVideoModel.fromJson(Map<String, dynamic> json) {
    return GetVideoModel(
      videoId: json['video_id'],
      id: json['id'],
      video: 'http://192.168.1.30:3000${json['video_data']}',
      thumbnail: 'http://192.168.1.30:3000${json['thumbnail']}',
      title: json['title'],
      description: json['description'],
      type: json['type'],
      totalLikes: json['total_likes'].toString(),
      totalDislikes: json['total_dislikes'].toString(),
      uploadedAt: DateFormat('dd MMM, yyyy')
          .format(DateTime.parse(json['uploaded_at'])),
      photo: json['photo'],
      name: json['name'],
    );
  }
}
