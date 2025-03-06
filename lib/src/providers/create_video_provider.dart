// ignore_for_file: avoid_print, use_build_context_synchronously

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
// ignore: depend_on_referenced_packages
import 'package:http_parser/http_parser.dart';
import 'package:project/src/providers/user_provider.dart';
import 'package:video_player/video_player.dart';

final uploadProvider =
    StateNotifierProvider<UploadNotifier, UploadModel>((ref) {
  return UploadNotifier(ref);
});

class UploadNotifier extends StateNotifier<UploadModel> {
  final Ref ref;
  UploadNotifier(this.ref)
      : super(UploadModel(
            videoData: null,
            thumbnail: null,
            title: '',
            description: '',
            type: '',
            isUploading: false,
            selectedIndex: -1,
            duration: ''));

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  void selectType(int index, String type) {
    state = state.copyWith(selectedIndex: index, type: type);
    print("Selected Type: ${state.type}");
  }

  void addTitle(String desc) {
    if (desc != state.title) {
      state = state.copyWith(title: desc);
    }
  }

  void addDescription(String desc) {
    if (desc != state.description) {
      state = state.copyWith(description: desc);
    }
  }

  Future<void> pickVideo() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.video,
      );

      if (result != null && result.files.single.path != null) {
        File pickedFile = File(result.files.single.path!);

        final controller = VideoPlayerController.file(pickedFile);
        await controller.initialize();
        Duration duration = controller.value.duration;
        int minutes = duration.inMinutes;
        int seconds = duration.inSeconds % 60;
        controller.dispose();
        final videoDuration = '$minutes:${seconds.toString().padLeft(2, '0')}';
        state = state.copyWith(videoData: pickedFile, duration: videoDuration);
        print('duration of video ==========> ${state.duration}');
        print("Selected video path: ${state.videoData?.path}");
      } else {
        print("No video selected");
      }
    } catch (e) {
      print("Error picking video: $e");
    }
  }

  Future<void> pickThumbnail() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null && result.files.single.path != null) {
        File pickedFile = File(result.files.single.path!);

        state = state.copyWith(thumbnail: pickedFile);
        print("Selected thumbnail path: ${state.thumbnail?.path}");
      } else {
        print("No thumbnail selected");
      }
    } catch (e) {
      print("Error picking thumbnail: $e");
    }
  }

  Future<void> uploadVideo(BuildContext context) async {
    final user = ref.watch(userProvider);
    if (state.videoData == null) {
      print("No video selected!");
      return;
    }

    if (state.thumbnail == null) {
      print("No thumbnail selected!");
      return;
    }

    state = state.copyWith(isUploading: true);
    try {
      var uri = Uri.parse('http://192.168.1.30:3000/api/controllers/videos');
      var request = http.MultipartRequest('POST', uri);

      String? mimeType = lookupMimeType(state.videoData!.path) ?? 'video/mp4';
      MediaType mediaType = MediaType.parse(mimeType);

      String? thumbMimeType =
          lookupMimeType(state.thumbnail!.path) ?? 'image/png';
      MediaType thumbMediaType = MediaType.parse(thumbMimeType);

      print(state.videoData?.path);
      print(state.thumbnail?.path);

      request.files.add(
        await http.MultipartFile.fromPath(
          'video_data',
          state.videoData!.path,
          contentType: mediaType,
        ),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'thumbnail',
          state.thumbnail!.path,
          contentType: thumbMediaType,
        ),
      );

      request.headers['Authorization'] = user.token;

      request.fields['id'] = user.id.toString();
      request.fields['title'] = state.title;
      request.fields['description'] = state.description;
      request.fields['type'] = state.type;
      request.fields['duration'] = state.duration;

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        print("Video uploaded successfully!");
        state = state.copyWith(
            isUploading: false,
            title: "",
            description: "",
            videoData: null,
            thumbnail: null,
            type: "",
            selectedIndex: -1,
            duration: '');

        // Show success Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Video uploaded successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print("Failed to upload video: $responseBody");
        state = state.copyWith(isUploading: false);

        // Show error Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to upload video!"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("Error uploading video: $e");
    } finally {
      state = state.copyWith(isUploading: false);
    }
  }
}

class UploadModel {
  final File? videoData;
  final File? thumbnail;
  final String title;
  final String description;
  final String type;
  final bool isUploading;
  final int selectedIndex;
  final String duration;

  UploadModel(
      {required this.videoData,
      required this.thumbnail,
      required this.title,
      required this.description,
      required this.type,
      required this.isUploading,
      required this.selectedIndex,
      required this.duration});

  UploadModel copyWith(
      {File? videoData,
      File? thumbnail,
      String? title,
      String? description,
      String? type,
      bool? isUploading,
      int? selectedIndex,
      String? duration}) {
    return UploadModel(
        videoData: videoData ?? this.videoData,
        thumbnail: thumbnail ?? this.thumbnail,
        title: title ?? this.title,
        description: description ?? this.description,
        type: type ?? this.type,
        isUploading: isUploading ?? this.isUploading,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        duration: duration ?? this.duration);
  }
}
