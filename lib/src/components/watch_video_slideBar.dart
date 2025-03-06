import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/utils/scale.dart';

class WatchVideoSlidebar extends StatelessWidget {
  final List<String> barText = [
    Strings.share,
    Strings.remix,
    Strings.thanks,
    Strings.stopAds,
    Strings.clip,
    Strings.save,
    Strings.report
  ];

  final List<IconData> barIcon = [
    AppIcons.share,
    AppIcons.remix,
    AppIcons.money,
    AppIcons.stopCircle,
    AppIcons.clip,
    AppIcons.save,
    AppIcons.flag
  ];

  WatchVideoSlidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: Scale.screenHeight * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: barText.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 34, 34, 34),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.toScale),
                ),
              ),
              onPressed: () {
                // Button action here
              },
              icon: Icon(
                barIcon[index],
                size: 20,
                color: Colors.white,
              ),
              label: Text(
                barText[index],
                style: const TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
