import 'dart:io';

import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileImgField extends StatelessWidget {
  const UserProfileImgField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SignUpCubit, SignUpState, File?>(
      bloc: sl<SignUpCubit>(), // SL 인스턴스 직접 주입
      selector: (state) => state.profileImage, // 부분만 구독
      builder: (context, profileImage) {
        return GestureDetector(
          onTap: () async {
            final image = await ImagePicker().pickImage(
              source: ImageSource.gallery,
            );
            sl<SignUpCubit>().changeProfileImage(image);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: profileImage == null
                ? const AssetImage('assets/images/default_avatar.png')
                : FileImage(profileImage),
          ),
        );
      },
    );
  }
}
