import 'package:flutter/material.dart';

class UploadBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 75, 75, 75),
                minimumSize: Size(160, 40)),
            child: const Text(
              "Save draft",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, minimumSize: Size(160, 40)),
            child: const Text(
              "Upload Short",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
