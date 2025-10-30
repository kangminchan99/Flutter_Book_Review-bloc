import 'package:bookreview/src/core/router/router.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BookReviewApp());
}

class BookReviewApp extends StatelessWidget {
  const BookReviewApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MultiRepositoryProvider - 앱에서 사용하는 모든 repository를 등록
    return MultiRepositoryProvider(
      providers: [],
      // MultiBlocProvider - 앱에서 사용하는 모든 bloc을 등록
      child: MultiBlocProvider(
        providers: [],
        child: MaterialApp.router(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: AppColors.backgroundColor,
              titleTextStyle: TextStyle(color: AppColors.white),
            ),
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
