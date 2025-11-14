import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final String uid;
  ProfileCubit(this.uid) : super(ProfileState()) {
    _loadUserProfile();
  }

  void _loadUserProfile() async {
    emit(state.copyWith(status: CommonStateStatus.loading));
    var userInfo = await sl<AbstractUserRepo>().findUserOne(uid);
    if (userInfo == null) {
      emit(state.copyWith(status: CommonStateStatus.error));
    } else {
      emit(
        state.copyWith(userModel: userInfo, status: CommonStateStatus.loaded),
      );
    }
  }

  void toggleFollow(String myUid) async {
    if (state.userModel?.followers != null &&
        state.userModel!.followers!.contains(myUid)) {
      // unfollow
      var result = await sl<AbstractUserRepo>().followEvent(
        false,
        myUid,
        state.userModel!.uid!,
      );

      if (result) {
        _unfollow(myUid);
      }
    } else {
      // follow
      var result = await sl<AbstractUserRepo>().followEvent(
        true,
        myUid,
        state.userModel!.uid!,
      );
      if (result) {
        _follow(myUid);
      }
    }
  }

  void _follow(uid) {
    if (state.userModel!.followers == null) {
      emit(
        state.copyWith(
          userModel: state.userModel!.copyWith(
            followers: List.unmodifiable([uid]),
          ),
        ),
      );
    } else {
      emit(
        state.copyWith(
          userModel: state.userModel!.copyWith(
            followers: List.unmodifiable([...state.userModel!.followers!, uid]),
          ),
        ),
      );
    }
  }

  void _unfollow(String uid) {
    final updatedFollowers = state.userModel!.followers!
        .where((e) => e != uid)
        .toList(); // Iterable -> List

    emit(
      state.copyWith(
        userModel: state.userModel!.copyWith(
          followers: List.unmodifiable(updatedFollowers),
        ),
      ),
    );
  }
}

class ProfileState extends Equatable {
  final UserModel? userModel;
  final CommonStateStatus status;
  const ProfileState({this.userModel, this.status = CommonStateStatus.init});

  ProfileState copyWith({UserModel? userModel, CommonStateStatus? status}) {
    return ProfileState(
      userModel: userModel ?? this.userModel,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [userModel, status];
}
