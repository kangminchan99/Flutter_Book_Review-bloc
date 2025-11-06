import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  static const String routerPath = '/home';
  static const String routerName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: Center(child: Text('Home Page')));
  }
}
