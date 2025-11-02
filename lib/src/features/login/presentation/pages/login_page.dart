import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/login_button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routerName = 'login';
  static const String routerPath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
            Container(
              color: AppColors.black.withValues(alpha: 0.6),
              child: SafeArea(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          '책 리뷰',
                          style: AppTextStyle.xxxLargeWhiteBold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        Text(
                          '로그인하여 직접 리뷰를 남겨보세요.\n많은 이들이 책을 고르기에 도움이 될 것입니다.',
                          style: AppTextStyle.mediumWhite.copyWith(
                            color: AppColors.gray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Spacer(flex: 1),
                    Column(
                      children: [
                        Text(
                          '회원가입 / 로그인',
                          style: AppTextStyle.mediumWhite,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 40),
                        LoginButtonWidget(
                          onTap: () {},
                          title: 'Google로 계속하기',
                          imgPath: 'assets/svg/icons/google_logo.svg',
                          backgroundColor: AppColors.white,
                          titleColor: AppColors.black,
                        ),
                        SizedBox(height: 20),
                        LoginButtonWidget(
                          onTap: () {},
                          title: 'Apple로 계속하기',
                          imgPath: 'assets/svg/icons/apple_logo.svg',
                          backgroundColor: AppColors.black,
                          titleColor: AppColors.white,
                        ),
                      ],
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
