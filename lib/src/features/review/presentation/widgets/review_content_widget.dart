import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ReviewContentWidget extends StatelessWidget {
  const ReviewContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      style: AppTextStyle.largeWhite,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: '리뷰를 작성해 주세요.',
        contentPadding: const EdgeInsets.symmetric(horizontal: 25.0),
        hintStyle: AppTextStyle.largeWhite.copyWith(color: AppColors.gray),
      ),
    );
  }
}
