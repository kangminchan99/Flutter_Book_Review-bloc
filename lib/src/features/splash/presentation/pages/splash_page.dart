import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:bookreview/src/shared/presentation/cubit/app_data_load_cubit.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  static const String routerName = 'splash';
  static const String routerPath = '/splash';
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: BlocListener<AppDataLoadCubit, AppDataLoadState>(
        listenWhen: (previous, current) =>
            current.status == CommonStateStatus.loaded,
        listener: (context, state) {
          context.read<SplashCubit>().changeLoadStatus(LoadStatus.authCheck);
        },
        child: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/splash_bg.png', fit: BoxFit.cover),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '도서 리뷰 앱으로\n좋아하는 책을 찾아보세요',
                      style: AppTextStyle.xxxLargeWhiteBold,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    BlocBuilder<SplashCubit, LoadStatus>(
                      builder: (context, state) {
                        return Text(
                          '${state.message} 중...',
                          style: AppTextStyle.xLargeWhite.copyWith(
                            color: AppColors.gray,
                          ),
                          textAlign: TextAlign.center,
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
