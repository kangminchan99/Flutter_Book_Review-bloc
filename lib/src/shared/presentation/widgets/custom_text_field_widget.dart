import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final bool isEnabled;
  final void Function()? onTap;
  const CustomTextFieldWidget({super.key, this.isEnabled = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppColors.textFieldBackgroundColor,
        ),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/svg/icons/icon_search.svg'),
            // SizedBox(width: 10),
            // Text('검색어를 입력해주세요', style: AppTextStyle.largeWhite),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '검색어를 입력해주세요',
                  hintStyle: AppTextStyle.largeWhite.copyWith(
                    color: AppColors.gray,
                  ),
                  enabled: isEnabled,
                  contentPadding: EdgeInsets.only(left: 10, bottom: 2),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
