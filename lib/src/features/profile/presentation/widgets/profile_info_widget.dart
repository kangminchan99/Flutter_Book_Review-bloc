import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 33,
          backgroundColor: AppColors.gray,
          backgroundImage: AssetImage('assets/images/default_avatar.png'),
        ),
        SizedBox(height: 20),
        Text('최고의 글쟁이가 되기 위한 도전', style: AppTextStyle.largeWhite),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.gray),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/icons/icon_journals.svg'),
                  Text(
                    '100',
                    style: AppTextStyle.mediumWhite.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.gray),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/icons/icon_people.svg'),
                  Text(
                    '100',
                    style: AppTextStyle.mediumWhite.copyWith(
                      color: AppColors.gray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
