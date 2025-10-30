import 'package:bookreview/src/details.dart';
import 'package:bookreview/src/home.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Home()),
    GoRoute(path: '/details', builder: (context, state) => const Details()),
  ],
  initialLocation: '/',
);
