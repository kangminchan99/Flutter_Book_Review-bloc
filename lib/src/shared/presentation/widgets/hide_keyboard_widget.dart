import 'package:flutter/material.dart';

class HideKeyboardWidget extends StatelessWidget {
  final Widget child;
  const HideKeyboardWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: FocusScope.of(context).unfocus, child: child);
  }
}
