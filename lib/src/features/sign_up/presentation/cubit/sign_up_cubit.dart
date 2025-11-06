import 'dart:io';

import 'package:bookreview/src/core/helper/helper.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

enum SignUpStatus { init, loading, uploading, success, fail }

class SignUpCubit extends Cubit<SignUpState> {
  final AbstractUserRepo _userRepo;
  SignUpCubit(UserModel userModel, this._userRepo)
    : super(SignUpState(userModel: userModel));

  void changeProfileImage(XFile? image) {
    if (image == null) return;

    var file = File(image.path);
    emit(state.copyWith(profileImage: file));
  }

  void changeNickname(String nickname) {
    emit(state.copyWith(nickname: nickname));
  }

  void changeDescription(String description) {
    emit(state.copyWith(description: description));
  }

  void updateProfileImageUrl(String url) {
    var updatedUserModel = state.userModel!.copyWith(profile: url);
    emit(
      state.copyWith(userModel: updatedUserModel, status: SignUpStatus.loading),
    );
    submit();
  }

  void save(BuildContext context) async {
    if (state.nickname == null || state.nickname!.isEmpty) {
      Helper.customSnackBar('닉네임을 입력하세요', context);
      return;
    }
    emit(state.copyWith(status: SignUpStatus.loading));
    await Future.delayed(Duration(seconds: 3));

    if (state.profileImage != null) {
      emit(state.copyWith(status: SignUpStatus.uploading));
    } else {
      submit();
    }
  }

  // firebase에 저장
  void submit() async {
    var joinUserModel = state.userModel!.copyWith(
      name: state.nickname,
      description: state.description,
    );

    var result = await _userRepo.joinUser(joinUserModel);
    if (result) {
      emit(state.copyWith(status: SignUpStatus.success));
    } else {
      emit(state.copyWith(status: SignUpStatus.fail));
    }
  }

  void uploadProgress(String progress) {
    emit(state.copyWith(progress: progress));
  }
}

class SignUpState extends Equatable {
  final File? profileImage;
  final String? nickname;
  final String? description;
  final String? progress;
  final SignUpStatus status;
  final UserModel? userModel;
  const SignUpState({
    this.profileImage,
    this.nickname,
    this.description,
    this.status = SignUpStatus.init,
    this.userModel,
    this.progress,
  });

  SignUpState copyWith({
    File? profileImage,
    String? nickname,
    String? description,
    SignUpStatus? status,
    UserModel? userModel,
    String? progress,
  }) {
    return SignUpState(
      profileImage: profileImage ?? this.profileImage,
      nickname: nickname ?? this.nickname,
      description: description ?? this.description,
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object?> get props => [
    profileImage,
    nickname,
    description,
    status,
    userModel,
    progress,
  ];
}
