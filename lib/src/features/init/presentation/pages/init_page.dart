import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/shared/presentation/cubit/init_cubit.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitPage extends StatelessWidget {
  static const String routerName = 'init';
  static const String routerPath = '/init';

  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
            Positioned(
              bottom: 0,
              left: 40,
              right: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '도서 리뷰 앱으로\n좋아하는 책을 찾아보세요',
                    style: AppTextStyle.xxxLargeWhiteBold,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '책리뷰에서 솔직하고 통찰력 있는 리뷰를 받아보세요.\n모든 장르에 책에 대한 리뷰를 확인할 수 있습니다.\n(로맨스에서 공상과학까지)',
                    style: AppTextStyle.mediumWhite.copyWith(
                      color: AppColors.gray,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  MainButtonWidget(
                    onTap: context.read<InitCubit>().startApp,
                    title: '시작하기',
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
