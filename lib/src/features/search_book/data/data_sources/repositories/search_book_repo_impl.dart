import 'package:bookreview/src/core/network/error/exceptions.dart';
import 'package:bookreview/src/core/network/error/failures.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/remote/search_book_impl_api.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';
import 'package:bookreview/src/features/search_book/domain/repositories/abstract_search_book_repo.dart';
import 'package:dartz/dartz.dart';

class SearchBookRepoImpl extends AbstractSearchBookRepo {
  final SearchBookImplApi _searchBookImplApi;

  SearchBookRepoImpl(this._searchBookImplApi);

  @override
  Future<Either<Failure, SearchBookApiResponse>> searchNaverBooks(
    SearchBookParams params,
  ) async {
    try {
      final result = await _searchBookImplApi.searchNaverBooks(params);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on CancelTokenException catch (e) {
      return Left(CancelTokenFailure(e.message, e.statusCode));
    }
  }
}
