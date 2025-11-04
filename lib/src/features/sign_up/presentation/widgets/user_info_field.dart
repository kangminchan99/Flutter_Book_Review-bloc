import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/sign_up_text_field.dart';
import 'package:flutter/material.dart';

class UserInfoField extends StatelessWidget {
  const UserInfoField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('닉네임', style: AppTextStyle.largeWhite),
        SizedBox(height: 15),
        SignUpTextField(type: SignUpTextFieldType.nickname),
        SizedBox(height: 30),
        Text('한줄 소개', style: AppTextStyle.largeWhite),
        SizedBox(height: 15),
        SignUpTextField(type: SignUpTextFieldType.description),
      ],
    );
  }
}
