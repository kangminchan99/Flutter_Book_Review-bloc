import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(String uid, SearchBookModel searchBookModel)
    : super(
        ReviewState(
          reviewModel: ReviewModel(book: searchBookModel, reviewerId: uid),
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
    print(state.reviewModel);
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
