import 'package:bookreview/src/features/login/domain/model/user_model.dart';

abstract class AbstractAuthApi {
  Stream<UserModel?> get user;

  Future<void> signInWithGoogle();

  Future<void> signInWithApple();

  Future<void> signOut();
}
