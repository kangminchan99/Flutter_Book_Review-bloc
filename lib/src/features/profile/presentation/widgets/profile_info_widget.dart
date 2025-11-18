import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_review_cubit.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:bookreview/src/shared/presentation/widgets/icon_statistic_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<ProfileCubit>();
    if (cubit.state.status == CommonStateStatus.loading) {
      return Center(child: CircularProgressIndicator.adaptive());
    }
    return Column(
      children: [
        SizedBox(height: 20),
        CircleAvatar(
          radius: 33,
          backgroundColor: AppColors.gray,
          backgroundImage: cubit.state.userModel?.profile == null
              ? AssetImage('assets/images/default_avatar.png')
              : CachedNetworkImageProvider(cubit.state.userModel!.profile!),
        ),
        SizedBox(height: 20),
        Text(
          cubit.state.userModel?.description ?? '',
          style: AppTextStyle.largeWhite,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.gray),
              ),
              child: BlocBuilder<ProfileReviewCubit, ProfileReviewState>(
                builder: (context, state) {
                  return IconStatisticWidget(
                    svgPath: 'assets/svg/icons/icon_journals.svg',
                    count: state.reviews.length,
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: AppColors.gray),
              ),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  return IconStatisticWidget(
                    svgPath: 'assets/svg/icons/icon_people.svg',
                    count: cubit.state.userModel?.followers?.length ?? 0,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
