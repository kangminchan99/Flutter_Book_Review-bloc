import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:flutter/material.dart';

class BookReviewerWidget extends StatelessWidget {
  const BookReviewerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('리뷰어', style: AppTextStyle.xLargeWhiteBold),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
