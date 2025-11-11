import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookInfoCubit extends Cubit<BookInfoState> {
  final String uid;
  final String bookId;
  BookInfoCubit(this.uid, this.bookId) : super(BookInfoState()) {
    _loadBookReviewInfo();
  }

  Future<void> _loadBookReviewInfo() async {
    emit(state.copyWith(status: CommonStateStatus.loading));
    var data = await sl<AbstractBookReviewInfoRepo>().loadBookReviewInfo(
      bookId,
    );

    if (data != null) {
      // 리뷰 정보가 있는 상태
      if (data.reviewerIds!.isEmpty) return;

      var reviewers = await sl<AbstractUserRepo>().allUserInfos(
        data.reviewerIds ?? [],
      );
      emit(
        state.copyWith(
          bookReviewInfoModel: data,
          reviewers: reviewers,
          status: CommonStateStatus.loaded,
        ),
      );
    } else {
      emit(state.copyWith(status: CommonStateStatus.loaded));
    }
  }

  Future<void> refresh() async {
    _loadBookReviewInfo();
  }
}

class BookInfoState extends Equatable {
  final BookReviewInfoModel? bookReviewInfoModel;
  final List<UserModel>? reviewers;
  final CommonStateStatus status;

  const BookInfoState({
    this.bookReviewInfoModel,
    this.reviewers,
    this.status = CommonStateStatus.init,
  });

  BookInfoState copyWith({
    BookReviewInfoModel? bookReviewInfoModel,
    List<UserModel>? reviewers,
    CommonStateStatus? status,
  }) {
    return BookInfoState(
      bookReviewInfoModel: bookReviewInfoModel ?? this.bookReviewInfoModel,
      reviewers: reviewers ?? this.reviewers,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [bookReviewInfoModel, reviewers, status];
}
