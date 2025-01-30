import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/components/bottom_drawer.dart';

class ShortsHeader extends StatelessWidget {
  const ShortsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        Padding(
          padding: EdgeInsets.only(right: 10.toScale),
          child: IconButton(
            icon: const Icon(AppIcons.threeDots),
            color: Colors.white,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  return BottomDrawer(
                    icons: [AppIcons.removeCircleOutline],
                    texts: [Strings.showLessShorts],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
