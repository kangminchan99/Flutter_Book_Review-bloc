import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppDividerWidget extends StatelessWidget {
  const AppDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          Divider(color: AppColors.black, height: 1),
          Divider(color: AppColors.doubleDividerColor, height: 1),
        ],
      ),
    );
  }
}
