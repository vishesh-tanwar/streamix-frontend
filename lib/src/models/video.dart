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
  final String duration;
  final bool? hasLiked;
  final bool? hasDisliked;
  GetVideoModel(
      {required this.videoId,
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
      required this.duration,
      this.hasLiked = false,
      this.hasDisliked = false});

  GetVideoModel copyWith({
    int? videoId,
    int? id,
    String? video,
    String? thumbnail,
    String? title,
    String? description,
    String? type,
    int? totalLikes,
    int? totalDislikes,
    String? uploadedAt,
    String? photo,
    String? name,
    String? handle,
    String? duration,
    bool? hasLiked,
    bool? hasDisliked,
  }) {
    return GetVideoModel(
      videoId: videoId ?? this.videoId,
      id: id ?? this.id,
      video: video ?? this.video,
      thumbnail: thumbnail ?? this.thumbnail,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      totalLikes: totalLikes ?? this.totalLikes,
      totalDislikes: totalDislikes ?? this.totalDislikes,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      photo: photo ?? this.photo,
      name: name ?? this.name,
      handle: handle ?? this.handle,
      duration: duration ?? this.duration,
      hasLiked: hasLiked ?? this.hasLiked,
      hasDisliked: hasDisliked ?? this.hasDisliked,
    );
  }

  // ignore: non_constant_identifier_names
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
      'duration': duration
    };
  }

  factory GetVideoModel.fromJson(Map<String, dynamic> json) {
    return GetVideoModel(
      videoId: json['video_id'] ?? '',
      id: json['id'] ?? '',
      video: json['video_data'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
      totalLikes: json['total_likes'] ?? '',
      totalDislikes: json['total_dislikes'] ?? '',
      uploadedAt: DateFormat('dd MMM, yyyy')
          .format(DateTime.parse(json['uploaded_at'])),
      photo: json['photo'] ?? '',
      name: json['name'] ?? '',
      handle: json['handle'] ?? '',
      duration: json['duration'] ?? '',
      hasLiked: json['hasLiked'] ?? false,
      hasDisliked: json['hasDisliked'] ?? false,
    );
  }
}
