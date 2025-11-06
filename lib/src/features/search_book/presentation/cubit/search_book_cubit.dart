import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';
import 'package:bookreview/src/features/search_book/domain/repositories/abstract_search_book_repo.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  final AbstractSearchBookRepo _searchBookRepo;
  SearchBookCubit(this._searchBookRepo) : super(SearchBookState());

  void searchBooks(String query) async {
    emit(state.copyWith(status: CommonStateStatus.loading));
    var searchParams = SearchBookParams(
      query: query,
      display: 10,
      start: 1,
      sort: NaverBookSortType.date,
    );
    var result = await _searchBookRepo.searchNaverBooks(searchParams);
    result.fold(
      (failure) {
        emit(state.copyWith(status: CommonStateStatus.error, response: null));
      },
      (data) {
        emit(state.copyWith(status: CommonStateStatus.loaded, response: data));
      },
    );
  }
}

class SearchBookState extends Equatable {
  final CommonStateStatus status;
  final SearchBookApiResponse? response;
  const SearchBookState({this.status = CommonStateStatus.init, this.response});

  SearchBookState copyWith({
    CommonStateStatus? status,
    SearchBookApiResponse? response,
  }) {
    return SearchBookState(
      status: status ?? this.status,
      response: response ?? this.response,
    );
  }

  @override
  List<Object?> get props => [status, response];
}
