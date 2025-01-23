import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<String> categories;
  final Function onDrawerTap;

  const CustomSliverAppBar({
    Key? key,
    required this.categories,
    required this.onDrawerTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Image.asset(
          'assets/images/yt2.png',
        ),
      ),
      titleSpacing: 1,
      title: const Text(
        "YouTube",
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
      expandedHeight: 100,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 85), // Space for the title bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => onDrawerTap(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(40, 40),
                    ),
                    child: const Icon(Icons.explore, color: Colors.white),
                  ),
                  ...categories.map((cat) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 41, 41, 41),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                        ),
                        child: Text(
                          cat,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
