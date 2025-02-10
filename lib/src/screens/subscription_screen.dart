import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ];

    _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      scopes: scopes,
    );
  }

  Future<void> _handleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      print("logging --------------> $account");
      setState(() {
        _currentUser = account;
      });
    } catch (error) {
      print("Sign-in failed: $error");
    }
  }

  Future<void> _handleSignOut() async {
    await _googleSignIn.signOut();
    setState(() {
      _currentUser = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _currentUser == null
        ? Center(
            child: ElevatedButton.icon(
              onPressed: _handleSignIn,
              icon: Icon(Icons.login),
              label: Text("Sign in with Google"),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Signed in as: ${_currentUser?.displayName}"),
              ElevatedButton.icon(
                onPressed: _handleSignOut,
                icon: Icon(Icons.logout),
                label: Text("Sign out"),
              ),
            ],
          );
  }
}
