import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class BookReviewersListWidget extends StatelessWidget {
  final List<UserModel> reviewers;
  final void Function() onCircleTap;
  const BookReviewersListWidget({
    super.key,
    required this.reviewers,
    required this.onCircleTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: onCircleTap,
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
