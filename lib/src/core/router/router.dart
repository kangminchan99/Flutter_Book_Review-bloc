import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/home/presentation/pages/home_page.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/login/presentation/pages/login_page.dart';
import 'package:bookreview/src/features/search/presentation/pages/search_page.dart';
import 'package:bookreview/src/features/sign_up/presentation/pages/sign_up_page.dart';
import 'package:bookreview/src/shared/presentation/pages/root_page.dart';
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
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: SearchPage.routerPath,
      name: SearchPage.routerName,
      builder: (context, state) => const SearchPage(),
    ),
    GoRoute(
      path: SignUpPage.routerPath,
      name: SignUpPage.routerName,
      builder: (context, state) => const SignUpPage(),
    ),
  ],
);
