import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:flutter/material.dart';

class BookBodyInfoWidget extends StatelessWidget {
  final SearchBookModel book;
  const BookBodyInfoWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('간단 소개', style: AppTextStyle.xLargeWhiteBold),
          SizedBox(height: 20),
          Text(
            book.description ?? '',
            style: AppTextStyle.mediumWhite.copyWith(
              color: AppColors.gray,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
