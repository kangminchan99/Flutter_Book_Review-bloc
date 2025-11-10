import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
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
      );

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

  void save() async {
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
      sl<AbstractBookReviewInfoRepo>().createBookReviewInfo(data);
    } else {
      // update
      bookReviewInfo.reviewerIds!.add(state.reviewModel!.reviewerId!);
      bookReviewInfo = bookReviewInfo.copyWith(
        totalRating: bookReviewInfo.totalRating! + state.reviewModel!.rating!,
        reviewerIds: bookReviewInfo.reviewerIds!.toSet().toList(),
        updatedAt: DateTime.now(),
      );

      sl<AbstractBookReviewInfoRepo>().updateBookReviewInfo(bookReviewInfo);
    }

    // var now = DateTime.now();
    // emit(
    //   state.copyWith(
    //     reviewModel: state.reviewModel!.copyWith(
    //       createdAt: now,
    //       updatedAt: now,
    //     ),
    //   ),
    // );
    // await sl<AbstractReviewRepo>().createReview(state.reviewModel!);
  }
}

class ReviewState extends Equatable {
  final ReviewModel? reviewModel;
  const ReviewState({this.reviewModel});

  @override
  List<Object?> get props => [reviewModel];

  ReviewState copyWith({ReviewModel? reviewModel}) {
    return ReviewState(reviewModel: reviewModel ?? this.reviewModel);
  }
}
