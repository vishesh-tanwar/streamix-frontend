import 'package:flutter/material.dart';
import 'package:project/src/models/video.dart';
// import 'package:project/src/providers/getvideo_provider.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/assets/strings.dart';

class Description extends StatelessWidget {
  final GetVideoModel video;

  const Description({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: Scale.screenHeight * 0.63,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed description headline
          Padding(
            padding: EdgeInsets.all(10.toScale),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  Icons.cancel_presentation_sharp,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(10.toScale),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Scale.screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '${video.totalLikes}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            Strings.likes,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "10 million",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            Strings.views,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            video.uploadedAt,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            Strings.date,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Scale.screenHeight * 0.02),
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 39, 39, 39),
                      borderRadius: BorderRadius.circular(12.toScale),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.toScale),
                      child: Text(
                        video.description,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
