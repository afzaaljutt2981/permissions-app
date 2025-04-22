import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:permissions_app/features/auth/model/google_user_model.dart';

class GoogleAuthService {


  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: Platform.isIOS
        ? '950374009589-54tmo5ue3sihime4bmaavpk2g8a4eg6u.apps.googleusercontent.com'
        : null,
  );

  Future<GoogleUserModel?> signInWithGoogle() async {

     await _googleSignIn.signOut(); // optional to show accounts everytime

    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      return GoogleUserModel(
        name: googleUser.displayName,
        email: googleUser.email,
        photoUrl: googleUser.photoUrl,
      );
    } catch (e) {
      return null;
    }
  }
}
