import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_review_cubit.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileReviewListWidget extends StatelessWidget {
  const ProfileReviewListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ProfileReviewCubit>().state;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 270,
      ),
      itemCount: state.reviews.length,
      itemBuilder: (context, index) {
        var review = state.reviews[index];
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.push(
              ReviewDetailPage.routerPath
                  .replaceFirst(':bookId', review.bookId!)
                  .replaceFirst(':uid', review.reviewerId!),
              extra: review.book!,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: CachedNetworkImage(
                    height: 150,
                    imageUrl: review.book?.image ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10,
                ),
                child: Text(
                  review.book?.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.mediumWhite,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 10,
                ),
                child: Text(
                  review.book?.author ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.mediumWhite.copyWith(
                    color: AppColors.gray,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
