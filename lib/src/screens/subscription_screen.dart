import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/icons.dart';
import 'package:project/src/providers/user_provider.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    final user = ref.watch(userProvider);

    final isSignedIn = userNotifier.currentUser != null;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSignedIn) ...[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.photo),
                ),
                const SizedBox(height: 16),
                Text(
                  "Signed in as:",
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "User ID: ${user.id}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 24),
              ],
              if (isSignedIn == false) ...[
                Image.asset(
                  AppIcons.youtubeLogoImage,
                  width: 200,
                  height: 200,
                  color: Colors.red,
                ),
                const SizedBox(height: 16),
              ],
              ElevatedButton.icon(
                onPressed: isSignedIn
                    ? userNotifier.handleSignOut
                    : userNotifier.handleSignIn,
                icon: Icon(
                  isSignedIn ? Icons.logout : Icons.login,
                  color: Colors.white,
                ),
                label: Text(
                  isSignedIn ? "Sign out" : "Sign in with Google",
                  style: const TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
