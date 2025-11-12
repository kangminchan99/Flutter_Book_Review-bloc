import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/review/domain/repositories/abstract_review_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewDetailCubit extends Cubit<ReviewDetailState> {
  final String bookId;
  final String uid;
  ReviewDetailCubit(this.bookId, this.uid) : super(ReviewDetailState()) {
    _loadReviewDetail();
    _loadUserInfoData();
  }

  void _loadReviewDetail() async {
    var reviewDetailData = await sl<AbstractReviewRepo>().loadReview(
      bookId,
      uid,
    );

    if (reviewDetailData != null) {
      emit(state.copyWith(reviewModel: reviewDetailData));
    }
  }

  void _loadUserInfoData() async {
    var userInfoData = await sl<AbstractUserRepo>().findUserOne(uid);

    if (userInfoData != null) {
      emit(state.copyWith(userModel: userInfoData));
    }
  }

  void toggleLikedReview(String myUid) async {
    if (state.reviewModel!.likedUsers == null) {
      // like 이벤트
      emit(
        state.copyWith(
          reviewModel: state.reviewModel!.copyWith(
            likedUsers: List.unmodifiable([myUid]),
          ),
        ),
      );
    } else {
      if (state.reviewModel!.likedUsers!.contains(myUid)) {
        // unlike 이벤트
        emit(
          state.copyWith(
            reviewModel: state.reviewModel!.copyWith(
              likedUsers: List.unmodifiable([
                ...state.reviewModel!.likedUsers!.where((my) => my != myUid),
              ]),
            ),
          ),
        );
      } else {
        // like 이벤트
        emit(
          state.copyWith(
            reviewModel: state.reviewModel!.copyWith(
              likedUsers: List.unmodifiable([
                ...state.reviewModel!.likedUsers!,
                myUid,
              ]),
            ),
          ),
        );
      }
    }
    await sl<AbstractReviewRepo>().updateReview(state.reviewModel!);
  }
}

class ReviewDetailState extends Equatable {
  final ReviewModel? reviewModel;
  final UserModel? userModel;

  const ReviewDetailState({this.reviewModel, this.userModel});

  ReviewDetailState copyWith({ReviewModel? reviewModel, UserModel? userModel}) {
    return ReviewDetailState(
      reviewModel: reviewModel ?? this.reviewModel,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  List<Object?> get props => [reviewModel, userModel];
}
