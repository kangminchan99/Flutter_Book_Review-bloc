import 'package:bookreview/src/core/helper/helper.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/profile/presentation/pages/profile_page.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_detail_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReviewDetailHeaderWidget extends StatelessWidget {
  const ReviewDetailHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: BlocBuilder<ReviewDetailCubit, ReviewDetailState>(
        builder: (context, state) {
          if (state.reviewModel == null) return Container();
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.push(
              ProfilePage.routerPath.replaceFirst(
                ':uid',
                state.userModel!.uid!,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 33,
                  backgroundColor: AppColors.gray,
                  backgroundImage: state.userModel?.profile == null
                      ? AssetImage('assets/images/default_avatar.png')
                      : CachedNetworkImageProvider(state.userModel!.profile!),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        state.userModel?.name ?? '',
                        style: AppTextStyle.largeWhite.copyWith(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '공감 ${state.reviewModel!.likedUsers?.length ?? 0}개',
                            style: AppTextStyle.xLargeWhiteBold.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            Helper.formatDateTime(
                              'yyyy-MM-dd',
                              state.reviewModel!.createdAt!,
                            ),
                            style: AppTextStyle.xLargeWhiteBold.copyWith(
                              fontSize: 12,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
