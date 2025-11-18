import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/presentation/cubit/book_info_cubit.dart';
import 'package:bookreview/src/features/book_info/presentation/pages/book_info_page.dart';
import 'package:bookreview/src/features/home/cubit/recent_review_cubit.dart';
import 'package:bookreview/src/features/home/presentation/pages/home_page.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/login/presentation/pages/login_page.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/cubit/profile_review_cubit.dart';
import 'package:bookreview/src/features/profile/presentation/pages/profile_page.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_cubit.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_detail_cubit.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_detail_page.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_page.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:bookreview/src/features/search_book/domain/repositories/abstract_search_book_repo.dart';
import 'package:bookreview/src/features/search_book/presentation/cubit/search_book_cubit.dart';
import 'package:bookreview/src/features/search_book/presentation/pages/search_book_page.dart';
import 'package:bookreview/src/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:bookreview/src/shared/presentation/pages/root_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RootPage.routerPath,
  refreshListenable: sl<AuthCubit>(),
  redirect: (context, state) {
    final status = sl<AuthCubit>().state.status;
    var blocPageInAuthState = [
      RootPage.routerPath,
      LoginPage.routerPath,
      SignUpPage.routerPath,
    ];
    switch (status) {
      case AuthStatus.init:
        break;
      case AuthStatus.authenticated:
        return blocPageInAuthState.contains(state.matchedLocation)
            ? HomePage.routerPath
            : state.matchedLocation;
      case AuthStatus.unauthenticated:
        return SignUpPage.routerPath;
      case AuthStatus.unknown:
        return LoginPage.routerPath;
      case AuthStatus.error:
        break;
    }
    return state.path;
  },
  routes: [
    GoRoute(
      path: RootPage.routerPath,
      name: RootPage.routerName,
      builder: (context, state) => const RootPage(),
    ),
    GoRoute(
      path: LoginPage.routerPath,
      name: LoginPage.routerName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: HomePage.routerPath,
      name: HomePage.routerName,
      builder: (context, state) => BlocProvider(
        create: (context) => RecentReviewCubit(),
        lazy: false,
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: BookInfoPage.routerPath,
      name: BookInfoPage.routerName,
      builder: (context, state) => BlocProvider(
        create: (context) => BookInfoCubit(
          sl<AuthCubit>().state.user!.uid!,
          (state.extra as SearchBookModel).isbn!,
        ),
        child: BookInfoPage(state.extra as SearchBookModel),
      ),
    ),
    GoRoute(
      path: ReviewPage.routerPath,
      name: ReviewPage.routerName,
      builder: (context, state) => BlocProvider(
        create: (context) {
          var bookModel = state.extra as SearchBookModel;
          var uid = sl<AuthCubit>().state.user!.uid!;
          return ReviewCubit(uid, bookModel);
        },
        child: ReviewPage(book: state.extra as SearchBookModel),
      ),
    ),
    GoRoute(
      path: SearchBookPage.routerPath,
      name: SearchBookPage.routerName,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchBookCubit(sl<AbstractSearchBookRepo>()),
        child: const SearchBookPage(),
      ),
    ),
    GoRoute(
      path: SignUpPage.routerPath,
      name: SignUpPage.routerName,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: ReviewDetailPage.routerPath,
      name: ReviewDetailPage.routerName,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewDetailCubit(
          state.pathParameters['bookId'] as String,
          state.pathParameters['uid'] as String,
        ),
        child: ReviewDetailPage(book: state.extra as SearchBookModel),
      ),
    ),
    GoRoute(
      path: ProfilePage.routerPath,
      name: ProfilePage.routerName,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProfileCubit(state.pathParameters['uid'] as String),
            // lazy를 false로 주어 페이지에 들어오는 순간 사용하지 않아도 자동적으로 ProfileCubit을
            // instance에 올린다.
            lazy: false,
          ),
          BlocProvider(
            create: (context) =>
                ProfileReviewCubit(state.pathParameters['uid'] as String),
            lazy: false,
          ),
        ],
        child: const ProfilePage(),
      ),
    ),
  ],
);
