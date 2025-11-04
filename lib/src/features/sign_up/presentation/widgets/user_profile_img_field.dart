import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class UserProfileImgField extends StatelessWidget {
  const UserProfileImgField({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: AppColors.gray,
        radius: 50,
        backgroundImage: Image.asset('assets/images/default_avatar.png').image,
      ),
    );
  }
}
