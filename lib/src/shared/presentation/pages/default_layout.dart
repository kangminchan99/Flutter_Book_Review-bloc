import 'package:bookreview/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final Widget? appBarTitle;
  final Widget? bottomNavigationBar;
  final Widget? floactingActionButton;
  final List<Widget>? actions;
  final Widget? leading;
  final bool? centerTitle;

  const DefaultLayout({
    super.key,
    required this.child,
    this.backgroundColor,
    this.appBarTitle,
    this.bottomNavigationBar,
    this.floactingActionButton,
    this.actions,
    this.leading,
    this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      appBar: _renderAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floactingActionButton,
    );
  }

  AppBar? _renderAppBar() {
    if (appBarTitle == null) {
      return null;
    }
    return AppBar(
      title: appBarTitle,
      foregroundColor: AppColors.white,
      leading: leading,
      centerTitle: centerTitle,
      actions: actions,
    );
  }
}
