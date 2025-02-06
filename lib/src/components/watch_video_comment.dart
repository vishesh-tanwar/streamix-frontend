import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';

class WatchVideoComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: Scale.screenHeight * 0.104,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 54, 54, 54),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Comments  0",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "No comments yet !!",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
