import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  static const String routerPath = '/search';
  static const String routerName = 'search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBarTitle: Text('검색'),
      child: Center(child: Text('Search Page')),
    );
  }
}
