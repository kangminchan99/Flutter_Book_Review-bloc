import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class ReviewerEmptyWidget extends StatelessWidget {
  const ReviewerEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('아직 등록된 리뷰어가 없습니다.', style: AppTextStyle.largeWhite),
    );
  }
}
