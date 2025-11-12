import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/features/book_info/presentation/cubit/book_info_cubit.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookReviewersListWidget extends StatelessWidget {
  final List<UserModel> reviewers;
  final BookInfoState state;
  const BookReviewersListWidget({
    super.key,
    required this.reviewers,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.push(
                ReviewDetailPage.routerPath
                    .replaceFirst(':bookId', state.bookReviewInfoModel!.bookId!)
                    .replaceFirst(':uid', state.reviewers![index].uid!),
                extra: state.bookReviewInfoModel!.bookInfo!,
              );
            },
            child: Hero(
              tag: 'reviewer_${reviewers[index].uid}',
              child: CircleAvatar(
                radius: 32,
                backgroundColor: AppColors.gray,
                backgroundImage: AssetImage('assets/images/default_avatar.png'),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            SizedBox(width: 20),
        itemCount: reviewers.length,
      ),
    );
  }
}
