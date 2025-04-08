// ignore_for_file: avoid_print

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/src/assets/strings.dart';
import 'package:project/src/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(UserModel(
            id: -1,
            isLoggedIn: false,
            name: "",
            email: "",
            photo: "",
            handle: "",
            token: ""));

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/contacts.readonly'],
  );
  GoogleSignInAccount?
      currentUser; // GoogleSignInAccount: This is a class from the google_sign_in
  // package in Flutter,representing a signed-in Google user.

  Future<void> handleSignIn() async {
    try {
      final account = await _googleSignIn.signIn(); // sign in executes
      if (account != null) {
        currentUser = account;

        // Prepare user data
        Map<String, String> userData = {
          "name": account.displayName ?? "",
          "email": account.email,
          "photo": account.photoUrl ?? "",
        };
        final result = await _sendUserDataToBackend(userData);

        state = result.copyWith(isLoggedIn: true);
        print('is user logged in => ${state.isLoggedIn}');
        print('userId = ${state.id}');
      }
    } catch (error) {
      print("Sign-in failed: $error");
    }
  }

  Future<UserModel> _sendUserDataToBackend(Map<String, String> userData) async {
    const String backendUrl = "${Strings.url}/api/controllers/users";
    try {
      final response = await http.post(
        Uri.parse(backendUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 201) {
        print("User successfully stored in DB");

        final result = jsonDecode(response.body)["user"];
        print(result);
        final userModel = UserModel.fromJson(result);
        return userModel;
      } else {
        throw "Failed to store user: ${response.body}";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.signOut(); // executes google sign out
    currentUser = null;
    state = UserModel(
      id: -1,
      isLoggedIn: false,
      name: "",
      email: "",
      photo: "",
      handle: "",
      token: "",
    );
  }
}
