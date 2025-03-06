import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/components/bottom_drawer.dart';
import 'package:project/src/models/video.dart';
import 'package:project/src/screens/shorts_screen.dart';
import 'package:project/src/utils/scale.dart';
// import '../models/reels.dart';

class ReelCard extends StatelessWidget {
  final GetVideoModel reels;
  final int index;

  const ReelCard({
    super.key,
    required this.reels,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShortsScreen(
                    showBackButton: true,
                    initialIndex: index // Pass the initial index),
                    ),
              ));
        },
        child: Container(
          width: Scale.screenWidth * 0.48,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'http://192.168.1.30:3000${reels.thumbnail}',
                      width: Scale.screenWidth * 0.46,
                      height: Scale.screenHeight * 0.323,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 10,
                    right: 10,
                    child: Text(
                      reels.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        backgroundColor: Color.fromARGB(0, 0, 0, 0),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                      top: 1,
                      left: Scale.screenWidth * 0.47 * 0.75,
                      child: IconButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 16,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return BottomDrawer(
                                icons: [
                                  AppIcons.cancel,
                                  Icons.feedback,
                                  Icons.flag
                                ],
                                texts: [
                                  Strings.notInterested,
                                  Strings.sendFeedback,
                                  Strings.report
                                ],
                              );
                            },
                          );
                        },
                      ))
                ],
              ),
              SizedBox(height: Scale.screenHeight * 0.007),
            ],
          ),
        ));
  }
}
