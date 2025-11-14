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

  @override
  Future<bool> followEvent(
    bool isFollow,
    String myUid,
    String targetUid,
  ) async {
    try {
      // batch - 저장을 한번에 처리하는 방식
      final batch = _db.batch();

      var targetUserDoc = await _db
          .collection(usersCollection)
          .where(uidField, isEqualTo: targetUid)
          .get();

      var targetUserInfo = UserModel.fromJson(targetUserDoc.docs.first.data());

      var followers = targetUserInfo.followers ?? [];

      if (isFollow) {
        followers.add(myUid);
      } else {
        followers.remove(myUid);
      }

      var targetRef = _db
          .collection(usersCollection)
          .doc(targetUserDoc.docs.first.id);

      batch.update(targetRef, {'followers': followers});

      var myDoc = await _db
          .collection(usersCollection)
          .where(uidField, isEqualTo: myUid)
          .get();

      var myInfo = UserModel.fromJson(myDoc.docs.first.data());

      var followings = myInfo.followings ?? [];

      if (isFollow) {
        followings.add(targetUid);
      } else {
        followings.remove(targetUid);
      }
      var myRef = _db.collection(usersCollection).doc(myDoc.docs.first.id);

      batch.update(myRef, {'followings': followings});

      await batch.commit();
      return true;
    } catch (e) {
      return false;
    }
  }
}
