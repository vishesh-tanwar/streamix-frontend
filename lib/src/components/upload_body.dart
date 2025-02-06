import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';

class UploadBody extends StatelessWidget {
  final List<IconData> logo = [
    AppIcons.visibility,
    AppIcons.userCircle,
    AppIcons.descriptionLine,
    AppIcons.play,
    AppIcons.addCardSharp,
    AppIcons.pay,
    AppIcons.description,
    AppIcons.checklist
  ];

  final List<String> label = [
    Strings.visibility,
    Strings.selectAudience,
    Strings.addDescription,
    Strings.relatedVideo,
    Strings.addToPlaylist,
    Strings.addPaidPromotionLabel,
    Strings.commentsRemixing,
    Strings.locationTagsAlteredContent
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
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 187, 184, 184),
                        fontSize: 11.5),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Regardless of your location, you're legally required to comply with the US Children's Online Policy Protection Act (COPPA) and/or other laws. You're required to tell us whether your videos are made for kids.",
                      ),
                      TextSpan(
                        text: " What's content Made for Kids?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(logo[index], color: Colors.white),
                        const SizedBox(width: 8),
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
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(logo[index], color: Colors.white),
                    const SizedBox(width: 8),
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
