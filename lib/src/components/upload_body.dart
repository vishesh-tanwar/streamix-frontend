import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/utils/scale.dart';

class UploadBody extends StatelessWidget {
  final List<IconData> logo = [
    AppIcons.visibility,
    AppIcons.thumbnail,
    AppIcons.descriptionLine,
  ];

  final List<String> label = [
    Strings.visibility,
    Strings.thumbnail,
    Strings.addDescription,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: label.length,
      itemBuilder: (context, index) {
        if (index == 2) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.toScale),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 187, 184, 184),
                        fontSize: 11.5),
                    children: <TextSpan>[
                      TextSpan(text: Strings.uploadText),
                      TextSpan(
                        text: Strings.uploadText2,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.toScale),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(logo[index], color: Colors.white),
                        SizedBox(width: Scale.screenWidth * 0.02),
                        Text(
                          label[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15.toScale),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(logo[index], color: Colors.white),
                    SizedBox(width: Scale.screenWidth * 0.02),
                    Text(label[index],
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ],
            ),
          );
        }
      },
    );
  }
}
