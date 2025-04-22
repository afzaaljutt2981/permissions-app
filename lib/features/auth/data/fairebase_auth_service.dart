import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:permissions_app/features/auth/model/google_user_model.dart';

class FacebookAuthService {
  Future<GoogleUserModel?> signInWithFacebook() async {
    try {
      await FacebookAuth.instance.logOut();

      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['public_profile', 'email'],
        loginBehavior: LoginBehavior.nativeWithFallback,
      );

      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData(
          fields: "name,email,picture.width(200)",
        );
        return _mapFacebookUserData(userData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  GoogleUserModel _mapFacebookUserData(Map<String, dynamic> data) {
    return GoogleUserModel(
      name: data['name'] as String?,
      email: data['email'] as String?,
      photoUrl: data['picture']?['data']?['url'] as String?,
    );
  }
}
