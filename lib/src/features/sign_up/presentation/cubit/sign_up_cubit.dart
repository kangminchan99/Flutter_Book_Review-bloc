import 'dart:io';

import 'package:bookreview/src/core/helper/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

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

  void save(BuildContext context) {
    if (state.nickname == null || state.nickname!.isEmpty) {
      Helper.customSnackBar('닉네임을 입력하세요', context);
      return;
    }

    if (state.profileImage != null) {
    } else {}
  }
}

class SignUpState extends Equatable {
  final File? profileImage;
  final String? nickname;
  final String? description;
  const SignUpState({this.profileImage, this.nickname, this.description});

  SignUpState copyWith({
    File? profileImage,
    String? nickname,
    String? description,
  }) {
    return SignUpState(
      profileImage: profileImage ?? this.profileImage,
      nickname: nickname ?? this.nickname,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [profileImage, nickname, description];
}
