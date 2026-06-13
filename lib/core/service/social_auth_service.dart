import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthService {

  static final GoogleSignIn _googleSignIn =
      GoogleSignIn.instance;
  static const String serverClientId =
      '891699953456-i3ubf5kgsnn03nkq0trjs57vli5c29to.apps.googleusercontent.com';

  static Future<String?> signInWithGoogle() async {
    await _googleSignIn.initialize(
      serverClientId: serverClientId,
    );

    final GoogleSignInAccount googleUser =
    await _googleSignIn.authenticate();
    print('Google User => ${googleUser.email}');
    final GoogleSignInAuthentication googleAuth =
        googleUser.authentication;

    return googleAuth.idToken;
  }

  /// FACEBOOK LOGIN
  static Future<String?> signInWithFacebook() async {

    try {

      final LoginResult result =
      await FacebookAuth.instance.login();

      if (result.status != LoginStatus.success) {
        return null;
      }

      /// ده اللي هتبعته للباك اند
      return result.accessToken?.tokenString;

    } catch (e) {
      rethrow;
    }
  }
}