import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';

class HorizontalButtonList extends StatelessWidget {
  final List<String> barText;
  final List<IconData> barIcon;

  const HorizontalButtonList(
      {super.key, required this.barText, required this.barIcon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Scale.screenHeight * 0.04,
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
