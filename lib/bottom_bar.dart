import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0), // Reduced vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Home
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.white,size: 20,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Home icon tapped")),
                    );
                  },
                ),
                const Text(
                  "Home",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            // Shorts
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.explore, color: Colors.white,size: 20,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Shorts icon tapped")),
                    );
                  },
                ),
                const Text(
                  "Shorts",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white,size: 20,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Add icon tapped")),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.subscriptions_outlined, color: Colors.white,size: 20,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Subscriptions icon tapped")),
                    );
                  },
                ),
                const Text(
                  "Subscriptions",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
            // You
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.verified_user, color: Colors.white,size: 20,),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("You icon tapped")),
                    );
                  },
                ),
                const Text(
                  "You",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
