import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project/src/models/user_model.dart';
import 'package:project/src/providers/user_provider.dart';

class GoogleSignInButton extends ConsumerWidget {
  const GoogleSignInButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    final user = ref.watch(userProvider);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              userNotifier.currentUser != null
                  ? Text(
                      "Signed in as: ${user.name} user id : ${user.id}",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(""),
              ElevatedButton.icon(
                onPressed: userNotifier.currentUser != null
                    ? userNotifier.handleSignOut
                    : userNotifier.handleSignIn,
                icon: Icon(Icons.logout),
                label: userNotifier.currentUser == null
                    ? Text("Sign in with Google")
                    : Text("Sign out"),
              ),
            ],
          ),
        ));
  }
}
