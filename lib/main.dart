import 'package:bookreview/firebase_options.dart';
import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/router/router.dart';
import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  await initInjections();
  runApp(const BookReviewApp());
}

class BookReviewApp extends StatelessWidget {
  const BookReviewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        fontFamily: 'NotoSans',
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          titleTextStyle: TextStyle(color: AppColors.white),
        ),
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
    );
  }
}
