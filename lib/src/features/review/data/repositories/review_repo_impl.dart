import 'package:bookreview/src/core/utils/constant/db_constant.dart';
import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/review/domain/repositories/abstract_review_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewRepoImpl extends AbstractReviewRepo {
  FirebaseFirestore db;
  ReviewRepoImpl(this.db);

  @override
  Future<void> createReview(ReviewModel data) async {
    await db.collection(reviewCollection).add(data.toJson());
  }

  @override
  Future<ReviewModel?> loadReview(String bookId, String reviewerId) async {
    var doc = await db
        .collection(reviewCollection)
        .where(bookIdField, isEqualTo: bookId)
        .where(reviewerIdField, isEqualTo: reviewerId)
        .get();

    if (doc.docs.isEmpty) {
      return null;
    } else {
      return ReviewModel.fromJson(doc.docs.first.data());
    }
  }

  @override
  Future<void> updateReview(ReviewModel data) async {
    var doc = await db
        .collection(reviewCollection)
        .where(bookIdField, isEqualTo: data.bookId)
        .where(reviewerIdField, isEqualTo: data.reviewerId)
        .get();

    await db
        .collection(reviewCollection)
        .doc(doc.docs.first.id)
        .update(data.toJson());
  }

  @override
  Future<List<ReviewModel>> loadUserReviews(String uid) async {
    try {
      var doc = await db
          .collection(reviewCollection)
          .where(reviewerIdField, isEqualTo: uid)
          .get();
      return doc.docs
          .map<ReviewModel>((e) => ReviewModel.fromJson(e.data()))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
