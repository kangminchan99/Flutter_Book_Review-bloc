import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';
import 'package:bookreview/src/features/search_book/domain/repositories/abstract_search_book_repo.dart';
import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  final AbstractSearchBookRepo _searchBookRepo;
  SearchBookCubit(this._searchBookRepo) : super(SearchBookState());

  // 초기 검색 시 호출하는 메서드
  void searchBooks(String query) async {
    emit(
      state.copyWith(
        status: CommonStateStatus.loading,
        response: const SearchBookApiResponse.init(),
        searchBookParams: SearchBookParams.init(query: query),
      ),
    );
    // 페이지 네이트 처리를 위해 별도 메서드로 분리해서 이것만 호출
    searchBooksApi();
  }

  void searchBooksApi() async {
    var result = await _searchBookRepo.searchNaverBooks(
      state.searchBookParams!,
    );

    result.fold(
      (failure) {
        emit(state.copyWith(status: CommonStateStatus.error, response: null));
      },
      (data) {
        // 데이터가 없거나 마지막 아이템인 경우
        if (data.start! > data.total! || data.items!.isEmpty) {
          emit(state.copyWith(status: CommonStateStatus.complete));
        } else {
          emit(
            state.copyWith(
              status: CommonStateStatus.loaded,
              response: state.response!.copyWith(
                items: data.items,
                total: data.total,
                start: data.start,
                display: data.display,
              ),
            ),
          );
        }
      },
    );
  }

  void paginateBooks() async {
    emit(
      state.copyWith(
        status: CommonStateStatus.loading,
        searchBookParams: state.searchBookParams!.copyWith(
          start: state.response!.start! + state.response!.display!,
        ),
      ),
    );
    searchBooksApi();
  }
}

class SearchBookState extends Equatable {
  final CommonStateStatus status;
  final SearchBookApiResponse? response;
  final SearchBookParams? searchBookParams;
  const SearchBookState({
    this.status = CommonStateStatus.init,
    this.response = const SearchBookApiResponse.init(),
    this.searchBookParams = const SearchBookParams.init(query: ''),
  });

  SearchBookState copyWith({
    CommonStateStatus? status,
    SearchBookApiResponse? response,
    SearchBookParams? searchBookParams,
  }) {
    return SearchBookState(
      status: status ?? this.status,
      response: response ?? this.response,
      searchBookParams: searchBookParams ?? this.searchBookParams,
    );
  }

  @override
  List<Object?> get props => [status, response, searchBookParams];
}
