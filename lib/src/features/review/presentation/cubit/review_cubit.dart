import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/review/domain/repositories/abstract_review_repo.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(String uid, SearchBookModel searchBookModel)
    : super(
        ReviewState(
          reviewModel: ReviewModel(
            book: searchBookModel,
            reviewerId: uid,
            bookId: searchBookModel.isbn,
          ),
        ),
      ) {
    _loadReviewInfo();
  }

  void _loadReviewInfo() async {
    var reviewInfo = await sl<AbstractReviewRepo>().loadReview(
      state.reviewModel!.bookId!,
      state.reviewModel!.reviewerId!,
    );

    emit(
      state.copyWith(
        isEditMode: reviewInfo != null,
        reviewModel: reviewInfo,
        beforeRating: reviewInfo?.rating,
      ),
    );
  }

  void changeRating(double rating) {
    emit(
      state.copyWith(reviewModel: state.reviewModel!.copyWith(rating: rating)),
    );
  }

  void changeReview(String review) {
    emit(
      state.copyWith(reviewModel: state.reviewModel!.copyWith(review: review)),
    );
  }

  Future<void> save() async {
    emit(state.copyWith(status: CommonStateStatus.loading));
    await Future.delayed(Duration(seconds: 3));
    var message = '';
    if (state.isEditMode == true) {
      // update
      await update();
      message = 'Review updated successfully';
    } else {
      // insert
      await insert();
      message = 'Review added successfully';
    }
    emit(state.copyWith(status: CommonStateStatus.loaded, message: message));
  }

  Future<void> insert() async {
    var now = DateTime.now();
    emit(
      state.copyWith(
        reviewModel: state.reviewModel!.copyWith(
          createdAt: now,
          updatedAt: now,
        ),
      ),
    );
    await sl<AbstractReviewRepo>().createReview(state.reviewModel!);

    var bookId = state.reviewModel!.bookId!;
    var bookReviewInfo = await sl<AbstractBookReviewInfoRepo>()
        .loadBookReviewInfo(bookId);

    if (bookReviewInfo == null) {
      // insert
      var data = BookReviewInfoModel(
        bookId: bookId,
        totalRating: state.reviewModel!.rating,
        bookInfo: state.reviewModel!.book,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        reviewerIds: [state.reviewModel!.reviewerId!],
      );
      await sl<AbstractBookReviewInfoRepo>().createBookReviewInfo(data);
    } else {
      // update
      bookReviewInfo.reviewerIds!.add(state.reviewModel!.reviewerId!);
      bookReviewInfo = bookReviewInfo.copyWith(
        totalRating:
            bookReviewInfo.totalRating! -
            (state.beforeRating ?? 0) +
            state.reviewModel!.rating!,
        reviewerIds: bookReviewInfo.reviewerIds!.toSet().toList(),
        updatedAt: DateTime.now(),
      );

      await sl<AbstractBookReviewInfoRepo>().updateBookReviewInfo(
        bookReviewInfo,
      );
    }
  }

  Future<void> update() async {
    var updateData = state.reviewModel!.copyWith(updatedAt: DateTime.now());
    await sl<AbstractReviewRepo>().updateReview(updateData);

    var bookReviewInfo = await sl<AbstractBookReviewInfoRepo>()
        .loadBookReviewInfo(updateData.bookId!);

    if (bookReviewInfo != null) {
      bookReviewInfo = bookReviewInfo.copyWith(
        updatedAt: DateTime.now(),
        totalRating:
            bookReviewInfo.totalRating! -
            (state.beforeRating ?? 0) +
            state.reviewModel!.rating!,
      );

      await sl<AbstractBookReviewInfoRepo>().updateBookReviewInfo(
        bookReviewInfo,
      );
    }
  }
}

class ReviewState extends Equatable {
  final ReviewModel? reviewModel;
  final bool? isEditMode;
  final double? beforeRating;
  final CommonStateStatus status;
  final String? message;

  const ReviewState({
    this.reviewModel,
    this.isEditMode,
    this.beforeRating,
    this.status = CommonStateStatus.init,
    this.message,
  });

  @override
  List<Object?> get props => [
    reviewModel,
    isEditMode,
    beforeRating,
    status,
    message,
  ];
  ReviewState copyWith({
    ReviewModel? reviewModel,
    bool? isEditMode,
    double? beforeRating,
    CommonStateStatus? status,
    String? message,
  }) {
    return ReviewState(
      reviewModel: reviewModel ?? this.reviewModel,
      isEditMode: isEditMode ?? this.isEditMode,
      beforeRating: beforeRating ?? this.beforeRating,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
