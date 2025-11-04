import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState());

  changeProfileImage(XFile? image) {
    if (image == null) return;

    var file = File(image.path);
    emit(state.copyWith(profileImage: file));
  }
}

class SignUpState extends Equatable {
  final File? profileImage;
  const SignUpState({this.profileImage});

  SignUpState copyWith({File? profileImage}) {
    return SignUpState(profileImage: profileImage ?? this.profileImage);
  }

  @override
  List<Object?> get props => [profileImage];
}
