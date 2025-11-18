import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconStatisticWidget extends StatelessWidget {
  final String svgPath;
  final int count;
  const IconStatisticWidget({
    super.key,
    required this.svgPath,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(svgPath),
        SizedBox(width: 5),
        Text(
          '$count',
          style: AppTextStyle.mediumWhite.copyWith(color: AppColors.gray),
        ),
      ],
    );
  }
}
