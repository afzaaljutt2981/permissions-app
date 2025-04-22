import 'package:permissions_app/features/auth/model/google_user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleAuthService {
  Future<GoogleUserModel?> signInWithApple() async {
    try {
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
      );

      return GoogleUserModel(
        name: "${result.givenName ?? ''} ${result.familyName ?? ''}",
        email: result.email,
        photoUrl: null,
      );
    } catch (e) {
      return null;
    }
  }
}
