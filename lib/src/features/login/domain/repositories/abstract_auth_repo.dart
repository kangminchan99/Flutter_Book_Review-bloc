import 'package:bookreview/src/features/login/domain/model/user_model.dart';

abstract class AbstractAuthRepo {
  Stream<UserModel?> get user;

  Future<void> signInWithGoogle();

  Future<void> signInWithApple();

  Future<void> signOut();
}
