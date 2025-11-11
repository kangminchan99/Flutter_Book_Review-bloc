import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ProgressLoading extends StatelessWidget {
  final String? progress;

  const ProgressLoading({super.key, this.progress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          color: AppColors.black.withValues(alpha: 0.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator.adaptive(
                  backgroundColor: AppColors.white,
                ),
                if (progress != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      '$progress',
                      style: AppTextStyle.xxxLargeWhiteBold,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
