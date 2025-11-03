import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatelessWidget {
  static const String routerPath = '/sign_up';
  static const String routerName = 'signUp';
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: Center(child: Text('Sign Up Page')));
  }
}
