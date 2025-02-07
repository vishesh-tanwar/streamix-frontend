import 'package:flutter/material.dart';
import 'package:project/src/utils/scale.dart';
import 'package:project/src/assets/strings.dart';

class WatchVideoComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.toScale),
      child: Container(
        height: Scale.screenHeight * 0.104,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.toScale),
          color: const Color.fromARGB(255, 54, 54, 54),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.toScale),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.zeroComments,
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.toScale),
                child: Text(
                  Strings.noComments,
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
