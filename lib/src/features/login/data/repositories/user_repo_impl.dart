import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepoImpl extends AbstractUserRepo {
  final FirebaseFirestore _db;

  UserRepoImpl(this._db);

  @override
  Future<UserModel?> findUserOne(String uid) async {
    try {
      var doc = await _db
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();

      if (doc.docs.isEmpty) {
        return null;
      } else {
        return UserModel.fromJson(doc.docs.first.data());
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> joinUser(UserModel userModel) async {
    try {
      await _db.collection('users').add(userModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }
}
