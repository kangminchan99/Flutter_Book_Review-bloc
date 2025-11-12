import 'package:bookreview/src/core/styles/app_text_style.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_detail_content_widget.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_detail_header_widget.dart';
import 'package:bookreview/src/features/review/presentation/widgets/review_header_widget.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:bookreview/src/shared/presentation/pages/default_layout.dart';
import 'package:bookreview/src/shared/presentation/widgets/app_divider_widget.dart';
import 'package:flutter/material.dart';

class ReviewDetailPage extends StatelessWidget {
  static const String routerName = 'review_detail';
  static const String routerPath = '/review_detail/:bookId/:uid';

  final SearchBookModel book;
  const ReviewDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBarTitle: Text('리뷰', style: AppTextStyle.xLargeWhiteBold),
      child: Column(
        children: [
          ReviewHeaderWidget(book: book, routerName: routerName),
          AppDividerWidget(),
          ReviewDetailHeaderWidget(),
          Expanded(child: ReviewDetailContentWidget()),
        ],
      ),
    );
  }
}
