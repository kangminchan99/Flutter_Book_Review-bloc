import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';

abstract class AbstractBookReviewInfoRepo {
  Future<void> createBookReviewInfo(BookReviewInfoModel data);

  Future<BookReviewInfoModel?> loadBookReviewInfo(String bookId);

  Future<void> updateBookReviewInfo(BookReviewInfoModel data);

  Future<List<BookReviewInfoModel>?> loadBookReviewRecentData();
}
