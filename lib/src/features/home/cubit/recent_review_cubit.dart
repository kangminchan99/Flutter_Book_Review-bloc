import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/domain/model/book_review_info_model.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentReviewCubit extends Cubit<RecentReviewState> {
  RecentReviewCubit() : super(RecentReviewState()) {
    _loadBookReviewInfo();
  }

  void _loadBookReviewInfo() async {
    var result = await sl<AbstractBookReviewInfoRepo>()
        .loadBookReviewRecentData();

    emit(state.copyWith(results: result));
  }
}

class RecentReviewState extends Equatable {
  final List<BookReviewInfoModel>? results;
  const RecentReviewState({this.results});

  RecentReviewState copyWith({List<BookReviewInfoModel>? results}) {
    return RecentReviewState(results: results ?? this.results);
  }

  @override
  List<Object?> get props => [results];
}
