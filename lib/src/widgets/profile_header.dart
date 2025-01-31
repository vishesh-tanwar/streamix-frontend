import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/utils/scale.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: Scale.screenWidth * 0.17,
            height: Scale.screenHeight * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage(AppIcons.reel2),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: Scale.screenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Vilgax",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Text(
                    "@vilgax1404  •  ",
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to channel
                    },
                    child: const Text(
                      "View channel >",
                      style: TextStyle(
                        color: Color.fromARGB(255, 128, 119, 119),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
