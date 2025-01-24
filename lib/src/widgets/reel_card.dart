import 'package:flutter/material.dart';
import '../models/reels.dart';

class ReelCard extends StatelessWidget {
  final Reels reels;

  const ReelCard({
    Key? key,
    required this.reels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 0, 0, 0),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack to layer title on top of the image
          Stack(
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  reels.thumbnail,
                  width: 160,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              // Title on top of image
              Positioned(
                bottom: 6, // Position title towards the bottom
                left: 10, // Position title towards the left
                right: 10, // Allow title to stretch
                child: Text(
                  reels.title, // The title from your Reels model
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    backgroundColor: Color.fromARGB(0, 0, 0, 0), // Optional background for better readability
                  ),
                  maxLines: 2, // Limit title to 2 lines
                  overflow: TextOverflow.ellipsis, // Add ellipsis for overflow text
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
        ],
      ),
    );
  }
}
