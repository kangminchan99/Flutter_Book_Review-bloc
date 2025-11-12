import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ReviewDetailContentWidget extends StatelessWidget {
  const ReviewDetailContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: SingleChildScrollView(
        child: BlocBuilder<ReviewDetailCubit, ReviewDetailState>(
          builder: (context, state) {
            var myUid = sl<AuthCubit>().state.user!.uid!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.reviewModel?.review ?? '',
                  style: AppTextStyle.largeWhite.copyWith(
                    color: AppColors.gray,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GestureDetector(
                    onTap: () {
                      context.read<ReviewDetailCubit>().toggleLikedReview(
                        sl<AuthCubit>().state.user!.uid!,
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/svg/icons/icon_liked.svg',
                      width: 30,
                      colorFilter:
                          state.reviewModel?.likedUsers?.contains(myUid) ??
                              false
                          ? ColorFilter.mode(
                              AppColors.btnBackgroundColor,
                              BlendMode.srcIn,
                            )
                          : ColorFilter.mode(AppColors.gray, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
