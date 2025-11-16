import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/core/utils/constant/network_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentReviewItemWidget extends StatelessWidget {
  const RecentReviewItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: Stack(
            children: [
              CachedNetworkImage(imageUrl: defaultImgUrl, fit: BoxFit.cover),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 45,
                  padding: EdgeInsets.only(left: 15),
                  color: AppColors.black.withValues(alpha: 0.5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/icons/icon_star.svg',
                        width: 22,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '8.98',
                        style: AppTextStyle.mediumWhite.copyWith(
                          color: AppColors.btnBackgroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text('제목', style: AppTextStyle.xLargeWhiteBold),
        SizedBox(height: 5),
        Text(
          '작가명',
          style: AppTextStyle.mediumWhite.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }
}
