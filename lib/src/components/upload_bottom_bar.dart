import 'package:flutter/material.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/utils/scale.dart';

class UploadBottomBar extends StatelessWidget {
  const UploadBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding:
          EdgeInsets.symmetric(vertical: 10.toScale, horizontal: 15.toScale),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                minimumSize:
                    Size(Scale.screenWidth * 0.45, Scale.screenHeight * 0.05)),
            child: const Text(
              Strings.saveDraft,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize:
                    Size(Scale.screenWidth * 0.45, Scale.screenHeight * 0.05)),
            child: const Text(
              Strings.uploadShort,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
