import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookHeaderWidget extends StatelessWidget {
  final SearchBookModel book;
  const BookHeaderWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Hero(
            tag: book.image ?? '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 152,
                height: 227,
                child: CachedNetworkImage(
                  imageUrl: book.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/svg/icons/icon_star.svg'),
              SizedBox(width: 4),
              Text(
                '8.88',
                style: AppTextStyle.mediumWhite.copyWith(
                  color: AppColors.btnBackgroundColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            book.title ?? '',
            style: AppTextStyle.xLargeWhiteBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5),
          Text(
            book.author ?? '',
            style: AppTextStyle.mediumWhite.copyWith(color: AppColors.gray),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
