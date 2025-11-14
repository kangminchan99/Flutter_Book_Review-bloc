import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/widgets/profile_info_widget.dart';
import 'package:bookreview/src/features/profile/presentation/widgets/profile_review_list_widget.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/app_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatelessWidget {
  static const String routerName = 'profile';
  static const String routerPath = '/profile/:uid';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myUid = sl<AuthCubit>().state.user!.uid;

    return DefaultLayout(
      appBarTitle: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Text(
            '${state.userModel?.name ?? ''} 리뷰어',
            style: AppTextStyle.xLargeWhiteBold,
          );
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().toggleFollow(myUid!);
            },
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                var isFollowing =
                    state.userModel?.followers?.contains(myUid) ?? false;
                return SvgPicture.asset(
                  isFollowing
                      ? 'assets/svg/icons/icon_follow_on.svg'
                      : 'assets/svg/icons/icon_follow_off.svg',
                );
              },
            ),
          ),
        ),
      ],
      // SingleChildScrollView를 사용하면 리스트 안에 리스트가 생길 경우 사용감이 좋지 않으므로
      // CustomScrollView를 사용하여 개선
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              ProfileInfoWidget(),
              AppDividerWidget(),
              ProfileReviewListWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
