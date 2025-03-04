import 'package:intl/intl.dart';

class GetVideoModel {
  final int videoId;
  final int id;
  final String video;
  final String thumbnail;
  final String title;
  final String description;
  final String type;
  final int totalLikes;
  final int totalDislikes;
  final String uploadedAt;
  final String photo;
  final String name;
  final String handle;

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
    required this.handle,
  });

  Map<String, dynamic> toJson({required int user_id}) {
    return {
      'handle': handle,
      'name': name,
      'photo': photo,
      'uploaded_at': uploadedAt,
      'description': description,
      'video_id': videoId,
      'id': id,
      'user_id': user_id, //  to send user id also to history
      'video_data': video,
      'thumbnail': thumbnail,
      'title': title,
      'total_likes': totalLikes,
      'total_dislikes': totalDislikes,
      'type': type,
    };
  }

  factory GetVideoModel.fromJson(Map<String, dynamic> json) {
    return GetVideoModel(
      videoId: json['video_id'],
      id: json['id'],
      video: json['video_data'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      description: json['description'],
      type: json['type'],
      totalLikes: json['total_likes'],
      totalDislikes: json['total_dislikes'],
      uploadedAt: DateFormat('dd MMM, yyyy')
          .format(DateTime.parse(json['uploaded_at'])),
      photo: json['photo'],
      name: json['name'],
      handle: json['handle'],
    );
  }
}
