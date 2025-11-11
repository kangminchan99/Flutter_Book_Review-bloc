import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/utils/constant/db_constant.dart';
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

  @override
  Future<List<UserModel>> allUserInfos(List<String> uids) async {
    var doc = await _db
        .collection(usersCollection)
        .where(uidField, whereIn: uids)
        .get();

    if (doc.docs.isEmpty) {
      return [];
    } else {
      return doc.docs.map((e) => UserModel.fromJson(e.data())).toList();
    }
  }
}
