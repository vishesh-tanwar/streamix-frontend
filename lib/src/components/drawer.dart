
import 'package:flutter/material.dart';
import '../assets/icons.dart'; 

// ignore: must_be_immutable
class MyDrawer extends StatelessWidget { 
  MyDrawer({Key? key}) : super(key: key);

  Map<String, dynamic> beforeLine = {
    "Trending": trendingIcon,
    "Shopping": shoppingIcon,
    "Music": musicIcon,
    "Films": filmIcon,
    "Live": liveIcon,
    "Gaming": gamingIcon,
    "News": newsIcon,
    "Sport": sportIcon,
    "Courses": coursesIcon,
    "Fashion & beauty": fashionIcon,
    "Podcasts": podcastsIcon,
  };

  Map<String, dynamic> afterLine = {
    "Youtube Premium": youtubeLogoImage,
    "Youtube Studio": youtubeStudioIcon,
    "Youtube Music": youtubeMusicIcon,
    "Youtube Kids": youtubeKidsIcon,
  };

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header Section
          Padding( 
            padding: EdgeInsets.all(8.0),
            
            child: SizedBox(
              height: 100,
              child: Row( 
                children: [
                  Image.asset(
                    youtubeLogoImage, 
                    height: 42,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Youtube",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),

          // Before line section
          ...beforeLine.entries.map((entry) {
            return ListTile(
              leading: Icon(
                entry.value,
                color: Colors.white,
              ),
              title: Text(
                entry.key,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${entry.key} tapped")),
                );
              },
            );
          }),

          // Divider after before line
          Divider(
            color: Colors.white,
            thickness: 1,
          ),

          // After line section
          ...afterLine.entries.map((entry) {
            return ListTile(
              leading: entry.value is String
                  ? Image.asset(
                      entry.value,
                      height: 30,
                    )
                  : Icon(
                      entry.value,
                      color: const Color.fromARGB(255, 255, 0, 0),
                    ),
              title: Text(
                entry.key,
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${entry.key} tapped")),
                );
              },
            );
          }),

          Center(
            child: Text(
              "Privacy Policy ~ Terms of Service",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
