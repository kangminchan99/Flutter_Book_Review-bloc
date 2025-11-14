import 'package:bookreview/src/features/login/domain/model/user_model.dart';

abstract class AbstractUserRepo {
  Future<UserModel?> findUserOne(String uid);

  Future<bool> joinUser(UserModel userModel);

  Future<List<UserModel>> allUserInfos(List<String> uids);

  Future<bool> followEvent(bool isFollow, String myUid, String targetUid);
}
