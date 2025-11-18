import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/home/presentation/widgets/recent_review_list_widget.dart';
import 'package:bookreview/src/features/home/presentation/widgets/top_reviewer_list_widget.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/search_book/presentation/pages/search_book_page.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const String routerPath = '/home';
  static const String routerName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBarTitle: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: sl<AuthCubit>().logout,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.gray,
                    backgroundImage: state.user?.profile == null
                        ? Image.asset('assets/images/default_avatar.png').image
                        : NetworkImage(state.user!.profile!),
                  ),
                  SizedBox(width: 10),
                  Text(state.user?.name ?? '', style: AppTextStyle.mediumWhite),
                ],
              ),
            );
          },
        ),
      ),
      centerTitle: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: CustomTextFieldWidget(
                isEnabled: false,
                onTap: () {
                  context.pushNamed(SearchBookPage.routerName);
                },
              ),
            ),
            RecentReviewListWidget(),
            TopReviewerListWidget(),
          ],
        ),
      ),
    );
  }
}
