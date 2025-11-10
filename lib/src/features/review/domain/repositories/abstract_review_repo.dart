import 'package:bookreview/src/features/review/domain/model/review_model.dart';

abstract class AbstractReviewRepo {
  Future<void> createReview(ReviewModel data);

  Future<ReviewModel?> loadReview(String bookId, String reviewerId);

  Future<void> updateReview(ReviewModel data);
}
