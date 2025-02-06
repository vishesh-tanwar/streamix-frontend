import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/models/reels.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/reel_card.dart';
import 'package:project/src/assets/strings.dart';

class WatchVideoReel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    AppIcons.reelLogo,
                    height: Scale.screenHeight * 0.045,
                  ),
                  SizedBox(width: Scale.screenWidth * 0.01),
                  const Text(
                    Strings.shorts,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: Scale.screenHeight * 0.36,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reelData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ReelCard(reels: reelData[index]),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
