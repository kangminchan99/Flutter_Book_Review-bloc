import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/book_info/presentation/cubit/book_info_cubit.dart';
import 'package:bookreview/src/features/book_info/presentation/widgets/book_reviewers_list_widget.dart';
import 'package:bookreview/src/features/book_info/presentation/widgets/reviewer_empty_widget.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
          BlocBuilder<BookInfoCubit, BookInfoState>(
            builder: (context, state) {
              if (state.bookReviewInfoModel == null) {
                return ReviewerEmptyWidget();
              } else {
                return BookReviewersListWidget(
                  reviewers: state.reviewers ?? [],
                  onCircleTap: () {
                    context.pushNamed(
                      ReviewDetailPage.routerName,
                      extra: state.bookReviewInfoModel!.bookInfo!,
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
