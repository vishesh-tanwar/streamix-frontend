import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  final Map<String, IconData> bottomMapping = const {
    "Home": Icons.home,
    "Shorts": Icons.explore,
    "": Icons.add,
    "Subscriptions": Icons.subscriptions,
    "You": Icons.verified_user,
  };

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 85,  // Reduced height
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 0), // No vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: bottomMapping.entries.map((entry) {
            // For entries where key is empty, handle the add icon separately
            if (entry.key.isEmpty) {
              return Container(
                height: 48,
                alignment: Alignment.topCenter,
                color: const Color.fromARGB(255, 0, 0, 0), // Red background color
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.translate(
                      offset: const Offset(0, -5), // Lift icon up
                      child: IconButton(
                        icon: Icon(entry.value, color: Colors.white, size: 25), // Increased icon size
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Add icon tapped")),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            // Handle other normal cases with text and icon
            return Container(
              height: 61
              ,
              alignment: Alignment.topCenter,
              color: const Color.fromARGB(255, 0, 0, 0), // Red background color
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: const Offset(0, -10), // Lift icon up
                    child: IconButton(
                      icon: Icon(entry.value, color: Colors.white, size: 20), // Increased icon size
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${entry.key} icon tapped")),
                        );
                      },
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -20), // Lift text up
                    child: Text(
                      entry.key,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 9, // Reduced text size
                        backgroundColor: Color.fromARGB(255, 0, 0, 0), // Red background for text
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
