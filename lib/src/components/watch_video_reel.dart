import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/icons.dart';
// import 'package:project/src/models/reels.dart';
import 'package:project/src/providers/getreel_provider.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/widgets/reel_card.dart';
import 'package:project/src/assets/strings.dart';

class WatchVideoReel extends ConsumerWidget {
  const WatchVideoReel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reelData = ref.watch(getReelsProvider);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.toScale),
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
            padding: EdgeInsets.all(8.toScale),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reelData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(2.toScale),
                  child: ReelCard(reels: reelData[index], index: index),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
