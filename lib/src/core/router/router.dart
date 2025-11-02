import 'package:bookreview/src/features/login/presentation/pages/login_page.dart';
import 'package:bookreview/src/shared/presentation/pages/root_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: LoginPage.routerPath,
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
  ],
);
