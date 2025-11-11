import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewDetailContentWidget extends StatelessWidget {
  const ReviewDetailContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              '리뷰 내용',
              style: AppTextStyle.largeWhite.copyWith(color: AppColors.gray),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/icons/icon_liked.svg',
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
