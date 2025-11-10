import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/review/presentation/cubit/review_cubit.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_content_widget.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_header_widget.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/app_divider_widget.dart';
import 'package:bookreview/src/shared/presentation/widgets/hide_keyboard_widget.dart';
import 'package:bookreview/src/shared/presentation/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewPage extends StatelessWidget {
  static const String routerName = 'review';
  static const String routerPath = '/review';

  final SearchBookModel book;
  const ReviewPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return HideKeyboardWidget(
      child: DefaultLayout(
        appBarTitle: Text('리뷰 작성', style: AppTextStyle.xLargeWhiteBold),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(30.0),
          child: MainButtonWidget(
            onTap: () {
              // 리뷰 저장 로직
              context.read<ReviewCubit>().save();
            },
            title: '저장',
          ),
        ),
        child: Column(
          children: [
            ReviewHeaderWidget(book: book),
            AppDividerWidget(),
            Expanded(child: ReviewContentWidget()),
          ],
        ),
      ),
    );
  }
}
