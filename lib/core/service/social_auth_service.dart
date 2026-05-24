import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialAuthService {

  static final GoogleSignIn _googleSignIn =
      GoogleSignIn.instance;

  /// GOOGLE LOGIN
  static Future<String?> signInWithGoogle() async {

    try {

      await _googleSignIn.initialize();

      final GoogleSignInAccount googleUser =
      await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      /// ده اللي هتبعته للباك اند
      return googleAuth.idToken;

    } catch (e) {
      rethrow;
    }
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