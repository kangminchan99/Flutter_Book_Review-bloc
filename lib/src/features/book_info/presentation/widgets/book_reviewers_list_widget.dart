import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/utils/constant/network_constant.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class BookReviewersListWidget extends StatelessWidget {
  final List<UserModel> reviewers;
  const BookReviewersListWidget({super.key, required this.reviewers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.gray,
            backgroundImage: NetworkImage(
              reviewers[index].profile ?? defaultImgUrl,
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
