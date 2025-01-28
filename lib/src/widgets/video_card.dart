import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';
import '../models/video.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Scale.screenWidth,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 10, 10, 10),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(5.toScale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Thumbnail
          Stack(
            children: [
              Image.asset(
                video.thumbnail,
                width: Scale.screenWidth,
                height: Scale.screenHeight * 0.256,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 180,
                left: 330,
                child: Container(
                  width: Scale.screenWidth * 0.1,
                  height: Scale.screenHeight * 0.02,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(141, 0, 0, 0),
                    borderRadius: BorderRadius.circular(5.toScale),
                  ),
                  child: Center(
                    child: Text(
                      video.duration,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: Scale.screenHeight * 0.01),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  video.thumbnail,
                  width: Scale.screenWidth * 0.1,
                  height: Scale.screenHeight * 0.05,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: Scale.screenWidth * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: Scale.screenHeight * 0.004),
                    Text(
                      '${video.channelName} • ${video.views} views • ${video.uploadDate}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: Scale.screenHeight * 0.02 ),
        ],
      ),
    );
  }
}
