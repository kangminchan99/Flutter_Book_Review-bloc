import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_cubit.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_slider_bar_widget.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewHeaderWidget extends StatelessWidget {
  final SearchBookModel book;
  const ReviewHeaderWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          Hero(
            tag: book.image ?? '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                width: 71,
                height: 106,
                child: CachedNetworkImage(
                  imageUrl: book.image ?? '',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  book.title ?? '',
                  style: AppTextStyle.xLargeWhiteBold.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  book.author ?? '',
                  style: AppTextStyle.mediumWhite.copyWith(
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: 10),
                BlocBuilder<ReviewCubit, ReviewState>(
                  builder: (context, state) {
                    return ReviewSliderBarWidget(
                      initValue: state.reviewModel?.rating ?? 0,
                      onChange: context.read<ReviewCubit>().changeRating,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
