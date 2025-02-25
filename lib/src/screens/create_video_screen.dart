import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/providers/create_video_provider.dart';
import 'package:project/src/providers/user_provider.dart';
import 'package:project/src/utils/scale.dart';

class CreateVideoScreen extends ConsumerWidget {
  CreateVideoScreen({super.key});

  final List<String> upload = [Strings.reel, Strings.video, Strings.post];

  final List<IconData> logo = [
    AppIcons.thumbnail,
    AppIcons.descriptionLine,
  ];

  final List<String> label = [
    Strings.thumbnail,
    Strings.addDescription,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadProvider);
    final uploadNotifier = ref.read(uploadProvider.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Column(
              children: [
                // Fixed header row
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.toScale),
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon:
                            const Icon(AppIcons.arrowBack, color: Colors.white),
                      ),
                      const Text(Strings.addDetails,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10.toScale),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: uploadNotifier.pickVideo,
                                child: Container(
                                  height: Scale.screenHeight * 0.18,
                                  width: Scale.screenWidth * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 190, 190, 190),
                                  ),
                                  child: uploadState.videoData != null
                                      ? Center(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Text("Uploaded"),
                                          ),
                                        )
                                      : const Icon(Icons.upload,
                                          color: Colors.white, size: 40),
                                ),
                              ),
                              SizedBox(width: Scale.screenWidth * 0.03),
                              Expanded(
                                child: TextField(
                                  controller: uploadNotifier.titleController
                                    ..text = uploadState.title,
                                  onChanged: (value) {
                                    uploadNotifier.addTitle(value);
                                  },
                                  maxLines: 4,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Enter Title...",
                                    hintStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 136, 136, 136)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Scale.screenHeight * 0.026),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(upload.length, (index) {
                                bool isSelected =
                                    index == uploadState.selectedIndex;
                                return InkWell(
                                    onTap: () {
                                      uploadNotifier.selectType(
                                          index, upload[index]);
                                    },
                                    child: Container(
                                      width: Scale.screenWidth * 0.3,
                                      height: Scale.screenHeight * 0.05,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.grey[800],
                                        borderRadius:
                                            BorderRadius.circular(8.toScale),
                                      ),
                                      child: Text(
                                        upload[index],
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ));
                              })),
                          SizedBox(height: Scale.screenHeight * 0.026),
                          Row(
                            children: [
                              Container(
                                width: Scale.screenWidth * 0.11,
                                height: Scale.screenHeight * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(20.toScale),
                                  image: const DecorationImage(
                                    image: AssetImage(AppIcons.reel2),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: Scale.screenWidth * 0.016),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Vilgax',
                                      style: TextStyle(color: Colors.white)),
                                  Text("@vilgax1404",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: Scale.screenHeight * 0.012),
                          Column(
                            children: [
                              // Pick Thumbnail ListTile
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: 15.toScale),
                                child: InkWell(
                                  onTap: uploadNotifier.pickThumbnail,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(AppIcons.thumbnail,
                                              color: Colors.white),
                                          SizedBox(
                                              width: Scale.screenWidth * 0.02),
                                          Text(Strings.thumbnail,
                                              style: const TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_forward_ios,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),

                              // Add Description ListTile
                              TextField(
                                controller: uploadNotifier.descriptionController
                                  ..text = uploadState.description,
                                onChanged: (value) {
                                  uploadNotifier.addDescription(value);
                                },
                                maxLines: 10,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Enter description...",
                                  hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 136, 136, 136)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Scale.screenHeight * 0.015),
                          ElevatedButton(
                            onPressed: uploadState.isUploading
                                ? null
                                : () => uploadNotifier.uploadVideo(context),
                            child: uploadState.isUploading
                                ? const CircularProgressIndicator(
                                    color: Colors.white)
                                : const Text("Upload Video"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
