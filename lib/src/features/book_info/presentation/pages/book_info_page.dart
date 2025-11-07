import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/book_info/presentation/widgets/book_body_info_widget.dart';
import 'package:bookreview/src/features/book_info/presentation/widgets/book_header_widget.dart';
import 'package:bookreview/src/features/book_info/presentation/widgets/reviewer_empty_widget.dart';
import 'package:bookreview/src/features/review/presentation/pages/review_page.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/app_divider_widget.dart';
import 'package:bookreview/src/shared/presentation/widgets/main_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookInfoPage extends StatelessWidget {
  static const String routerPath = '/book_info';
  static const String routerName = 'book_info';
  final SearchBookModel book;
  const BookInfoPage(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBarTitle: Text('책 소개', style: AppTextStyle.xLargeWhiteBold),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: MainButtonWidget(
          onTap: () {
            context.pushNamed(ReviewPage.routerName, extra: book);
          },
          title: '리뷰하기',
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookHeaderWidget(book: book),
              AppDividerWidget(),
              BookBodyInfoWidget(book: book),
              AppDividerWidget(),
              // BookReviewerWidget(),
              ReviewerEmptyWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
