import 'package:bookreview/src/core/helper/helper.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepoImpl extends AbstractAuthRepo {
  final FirebaseAuth _firebaseAuth;

  AuthRepoImpl(this._firebaseAuth);

  @override
  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user != null) {
        return UserModel(
          uid: user.uid,
          email: user.email,
          name: user.displayName,
        );
      }
      return null;
    });
  }

  @override
  Future<void> signInWithGoogle() async {
    final signIn = GoogleSignIn.instance;

    // 중요: 앱 시작 시 한 번만 호출. Android는 serverClientId(웹 클라이언트 ID) 필요할 수 있음.
    await signIn.initialize(
      // clientId: 'iOS/macOS용 클라이언트 ID(Optional)',
      // Android에서 오류나면 아래 serverClientId에 "웹 클라이언트 ID"를 넣어주세요.
      // serverClientId: 'YOUR_WEB_CLIENT_ID.apps.googleusercontent.com',
    );

    // v7: signIn()가 아니라 authenticate()
    final GoogleSignInAccount user = await signIn.authenticate();

    // 인증 토큰(idToken) 가져오기 — v7에서는 accessToken이 여기엔 없음(idToken만 제공)
    final auth =
        user.authentication; // GoogleSignInAuthentication(idToken: ...)

    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken, // 이거면 Firebase 로그인 OK
      // accessToken은 권한(scpes) 요청 후 authorization에서 받는 값 (필수 아님)
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<void> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = Helper.generateNonce();
    final nonce = Helper.sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
      accessToken: appleCredential.authorizationCode,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    await _firebaseAuth.signInWithCredential(oauthCredential);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
