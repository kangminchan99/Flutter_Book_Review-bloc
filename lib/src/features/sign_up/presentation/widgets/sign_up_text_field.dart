import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

enum SignUpTextFieldType { nickname, description }

class SignUpTextField extends StatelessWidget {
  final SignUpTextFieldType type;
  const SignUpTextField({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.white,
      textAlign: TextAlign.center,
      style: AppTextStyle.xLargeWhite.copyWith(
        fontSize: type == SignUpTextFieldType.nickname ? null : 12,
      ),
      maxLength: type == SignUpTextFieldType.nickname ? null : 50,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldBackgroundColor,
        counterStyle: type == SignUpTextFieldType.description
            ? AppTextStyle.mediumWhite
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          gapPadding: 0,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          gapPadding: 0,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
