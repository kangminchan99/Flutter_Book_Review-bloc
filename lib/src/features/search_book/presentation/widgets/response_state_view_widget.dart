import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ResponseStateViewWidget extends StatelessWidget {
  final String title;
  const ResponseStateViewWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppTextStyle.xxLargeWhite.copyWith(color: AppColors.gray),
      ),
    );
  }
}
