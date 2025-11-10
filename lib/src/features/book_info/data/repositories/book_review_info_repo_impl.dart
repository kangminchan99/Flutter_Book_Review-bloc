import 'package:bookreview/src/core/utils/constant/db_constant.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookReviewInfoRepoImpl extends AbstractBookReviewInfoRepo {
  FirebaseFirestore db;
  BookReviewInfoRepoImpl(this.db);

  @override
  Future<void> createBookReviewInfo(BookReviewInfoModel data) async {
    await db.collection(bookReviewInfoCollection).add(data.toJson());
  }

  @override
  Future<BookReviewInfoModel?> loadBookReviewInfo(String bookId) async {
    var doc = await db
        .collection(bookReviewInfoCollection)
        .where(bookIdField, isEqualTo: bookId)
        .get();

    if (doc.docs.isEmpty) {
      return null;
    } else {
      return BookReviewInfoModel.fromJson(doc.docs.first.data());
    }
  }

  @override
  Future<void> updateBookReviewInfo(BookReviewInfoModel data) async {
    var doc = await db
        .collection(bookReviewInfoCollection)
        .where(bookIdField, isEqualTo: data.bookId)
        .get();

    await db
        .collection(bookReviewInfoCollection)
        .doc(doc.docs.first.id)
        .update(data.toJson());
  }
}
