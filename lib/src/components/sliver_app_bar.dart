import 'package:flutter/material.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/utils/scale.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<String> categories;
  final Function onDrawerTap;

  const CustomSliverAppBar({
    super.key,
    required this.categories,
    required this.onDrawerTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Image.asset(
          AppIcons.youtubeLogoImage,
        ),
      ),
      titleSpacing: 1,
      title: const Text(
        Strings.youtube,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Notifications icon tapped")),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Search icon tapped")),
            );
          },
        ),
      ],
      pinned: false,
      floating: true,
      expandedHeight: Scale.screenHeight * 0.14,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Scale.screenHeight * 0.07),
            SizedBox(
              height: Scale.screenHeight * 0.04,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: ElevatedButton(
                        onPressed: () => onDrawerTap(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(40, 40),
                        ),
                        child: const Icon(Icons.explore, color: Colors.white),
                      ),
                    );
                  }
                  if (index == categories.length + 1) {
                    return Padding(
                      padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                      child: Text(
                        "Send Feedback",
                        style: TextStyle(color: Colors.blue),
                      ),
                    );
                  }
                  // Remaining category buttons
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 41, 41, 41),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.toScale),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                      child: Text(
                        categories[index - 1],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
