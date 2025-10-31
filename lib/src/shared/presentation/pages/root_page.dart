import 'package:bookreview/src/features/init/presentation/pages/init_page.dart';
import 'package:bookreview/src/features/splash/presentation/pages/splash_page.dart';
import 'package:bookreview/src/shared/presentation/cubit/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  static const String routerPath = '/';
  static const String routerName = 'root';
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitCubit, bool>(
      builder: (context, state) => !state ? InitPage() : SplashPage(),
    );
  }
}
