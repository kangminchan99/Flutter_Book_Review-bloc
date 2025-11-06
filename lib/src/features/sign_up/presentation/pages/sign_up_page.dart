import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/progress_loading.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/user_info_field.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/user_profile_img_field.dart';
import 'package:bookreview/src/shared/presentation/cubit/upload_cubit.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  static const String routerPath = '/sign_up';
  static const String routerName = 'signUp';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpCubit, SignUpState>(
          listenWhen: (previous, current) => previous.status != current.status,

          bloc: sl<SignUpCubit>(),
          listener: (context, state) {
            switch (state.status) {
              case SignUpStatus.init:
                break;
              case SignUpStatus.loading:
                break;
              case SignUpStatus.uploading:
                sl<UploadCubit>().uploadUserProfileImage(
                  state.profileImage!,
                  state.userModel!.uid!,
                );
                break;
              case SignUpStatus.success:
                sl<AuthCubit>().reloadAuth();
                break;
              case SignUpStatus.fail:
                break;
            }
          },
        ),
        BlocListener<UploadCubit, UploadState>(
          bloc: sl<UploadCubit>(),
          listener: (context, state) {
            switch (state.status) {
              case UploadStatus.init:
                break;
              case UploadStatus.uploading:
                sl<SignUpCubit>().uploadProgress(
                  state.progress!.toStringAsFixed(2),
                );
                break;
              case UploadStatus.success:
                sl<SignUpCubit>().updateProfileImageUrl(state.downloadUrl!);
                break;
              case UploadStatus.fail:
                break;
            }
          },
        ),
      ],
      child: Stack(
        children: [
          DefaultLayout(
            appBarTitle: Text(''),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7,
                  horizontal: 20,
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/svg/icons/icon_close.svg'),
                ),
              ),
            ],
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    BlocSelector<SignUpCubit, SignUpState, bool>(
                      selector: (s) => s.status == SignUpStatus.loading,
                      builder: (context, isLoading) {
                        return Expanded(
                          child: MainButtonWidget(
                            onTap: isLoading
                                ? null
                                : () => sl<SignUpCubit>().save(context),
                            title: isLoading ? '가입 중...' : '가입',
                            backgroundColor: !isLoading ? null : AppColors.gray,
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: MainButtonWidget(
                        onTap: () {},
                        title: '취소',
                        backgroundColor: AppColors.defaultBtnBackgroundColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  UserProfileImgField(),
                  SizedBox(height: 50),
                  UserInfoField(),
                ],
              ),
            ),
          ),

          BlocBuilder<SignUpCubit, SignUpState>(
            bloc: sl<SignUpCubit>(),
            buildWhen: (previous, current) =>
                previous.status != current.status ||
                previous.progress != current.progress,
            builder: (context, state) {
              if (state.progress != null &&
                  state.status == SignUpStatus.uploading) {
                return ProgressLoading(progress: '${state.progress}%');
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
