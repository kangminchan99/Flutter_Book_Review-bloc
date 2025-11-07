import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/search_book/presentation/cubit/search_book_cubit.dart';
import 'package:bookreview/src/features/search_book/presentation/widgets/response_view_widget.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/custom_text_field_widget.dart';
import 'package:bookreview/src/shared/presentation/widgets/hide_keyboard_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookPage extends StatelessWidget {
  static const String routerPath = '/search_book';
  static const String routerName = 'search_book';
  const SearchBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HideKeyboardWidget(
      child: DefaultLayout(
        appBarTitle: Text('책 검색', style: AppTextStyle.xLargeWhiteBold),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              CustomTextFieldWidget(
                onSubmitted: context.read<SearchBookCubit>().searchBooks,
              ),
              Expanded(child: ResponseViewWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
