import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color? backgroundColor;
  const MainButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    this.backgroundColor = AppColors.btnBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: backgroundColor ?? AppColors.btnBackgroundColor,
        ),
        child: Text(
          title,
          style: AppTextStyle.xLargeWhite,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
