import 'package:flutter/material.dart';

class ShortsHeader extends StatelessWidget {
  const ShortsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [ 
        Padding(
          padding: const EdgeInsets.only(left: 10.0), // Add left margin
          child: Row(
            children: [
              Image.asset(
                "assets/images/reel_logo.png",
                height: 37,
              ),
              const SizedBox(width: 8), // Space between image and text
              const Text(
                "Shorts",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0), 
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
