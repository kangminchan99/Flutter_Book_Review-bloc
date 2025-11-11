import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ReviewDetailHeaderWidget extends StatelessWidget {
  const ReviewDetailHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: AppColors.gray,
            backgroundImage: AssetImage('assets/images/default_avatar.png'),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '리뷰 작성자',
                  style: AppTextStyle.largeWhite.copyWith(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '공감 15개',
                      style: AppTextStyle.xLargeWhiteBold.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '2025.11.11',
                      style: AppTextStyle.xLargeWhiteBold.copyWith(
                        fontSize: 12,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
