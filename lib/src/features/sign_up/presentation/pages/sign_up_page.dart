import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:bookreview/src/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/user_info_field.dart';
import 'package:bookreview/src/features/sign_up/presentation/widgets/user_profile_img_field.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/main_button_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatelessWidget {
  static const String routerPath = '/sign_up';
  static const String routerName = 'signUp';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBarTitle: '',
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
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
              Expanded(
                child: MainButtonWidget(
                  onTap: () {
                    sl<SignUpCubit>().save(context);
                  },
                  title: '가입',
                ),
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
    );
  }
}
