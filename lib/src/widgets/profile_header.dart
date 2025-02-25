import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/providers/user_provider.dart';
import 'package:project/src/utils/scale.dart';

class ProfileHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: Scale.screenWidth * 0.17,
            height: Scale.screenHeight * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.toScale),
              image: DecorationImage(
                // image: AssetImage(AppIcons.reel2),
                image: NetworkImage(user.photo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: Scale.screenWidth * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    user.handle,
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to channel
                    },
                    child: const Text(
                      "View channel >",
                      style: TextStyle(
                        color: Color.fromARGB(255, 128, 119, 119),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
