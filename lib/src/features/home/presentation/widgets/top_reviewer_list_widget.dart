import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/home/cubit/top_reviewer_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/pages/profile_page.dart';
import 'package:bookreview/src/shared/presentation/widgets/icon_statistic_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TopReviewerListWidget extends StatelessWidget {
  const TopReviewerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopReviewerCubit, TopReviewerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text('TOP 10 리뷰어', style: AppTextStyle.xLargeWhiteBold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 15,
              ),
              child: Column(
                children: List.generate(state.results?.length ?? 0, (index) {
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        ProfilePage.routerPath.replaceFirst(
                          ':uid',
                          state.results![index].uid!,
                        ),
                      );
                    },
                    child: Container(
                      height: 85,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: AppColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(85),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            child: CircleAvatar(
                              backgroundColor: AppColors.gray,
                              backgroundImage:
                                  state.results![index].profile != null
                                  ? CachedNetworkImageProvider(
                                      state.results![index].profile!,
                                    )
                                  : null,
                              radius: 32,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.results![index].name ?? '',
                                  style: AppTextStyle.largeWhite,
                                ),
                                Text(
                                  state.results![index].description ?? '',
                                  style: AppTextStyle.mediumWhite.copyWith(
                                    color: AppColors.gray,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    IconStatisticWidget(
                                      svgPath:
                                          'assets/svg/icons/icon_journals.svg',
                                      count:
                                          state.results![index].reviewCount ??
                                          0,
                                    ),
                                    SizedBox(width: 20),
                                    IconStatisticWidget(
                                      svgPath:
                                          'assets/svg/icons/icon_people.svg',
                                      count:
                                          state.results![index].followerCount ??
                                          0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
