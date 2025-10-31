import 'package:bookreview/src/shared/presentation/pages/root_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: RootPage.routerPath,
  routes: [
    GoRoute(
      path: RootPage.routerPath,
      name: RootPage.routerName,
      builder: (context, state) => const RootPage(),
    ),
  ],
);
