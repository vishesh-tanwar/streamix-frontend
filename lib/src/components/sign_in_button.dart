// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInButton extends StatefulWidget {
//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }

// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   GoogleSignIn _googleSignIn = GoogleSignIn();

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: _handleSignIn,
//       icon: Icon(Icons.login),
//       label: Text("Sign in with Google"),
//     );
//   }

//   Future<void> _handleSignIn() async {
//     try {
//       final account = await _googleSignIn.signIn();
//       if (account != null) {
//         print("Signed in as: ${account.displayName}");
//       }
//     } catch (error) {
//       print("Sign-in failed: $error");
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInButton extends StatefulWidget {
//   @override
//   _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
// }

// class _GoogleSignInButtonState extends State<GoogleSignInButton> {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   GoogleSignInAccount? _currentUser;

//   @override
//   void initState() {
//     super.initState();
//     _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
//       setState(() {
//         _currentUser = account;
//       });
//     });
//     _googleSignIn.signInSilently();
//   }

//   Future<void> _handleSignIn() async {
//     try {
//       final account = await _googleSignIn.signIn();
//       if (account != null) {
//         setState(() {
//           _currentUser = account;
//         });
//         print("Signed in as: ${account.displayName}");
//       }
//     } catch (error) {
//       print("Sign-in failed: $error");
//     }
//   }

//   Future<void> _handleSignOut() async {
//     await _googleSignIn.signOut();
//     setState(() {
//       _currentUser = null;
//     });
//     print("User signed out");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//       onPressed: _currentUser == null ? _handleSignIn : _handleSignOut,
//       icon: Icon(_currentUser == null ? Icons.login : Icons.logout),
//       label: Text(_currentUser == null ? "Sign in with Google" : "Log out"),
//     );
//   }
// }
