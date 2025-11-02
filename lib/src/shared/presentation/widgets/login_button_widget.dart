import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String imgPath;
  final Color backgroundColor;
  final Color titleColor;
  const LoginButtonWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.imgPath,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        padding: EdgeInsets.symmetric(
          vertical: imgPath.contains('apple') ? 1 : 10,
          horizontal: imgPath.contains('apple') ? 20 : 30,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(imgPath),
            SizedBox(width: imgPath.contains('apple') ? 20 : 30),
            Text(
              title,
              style: AppTextStyle.xLargeWhiteBold.copyWith(
                color: titleColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
