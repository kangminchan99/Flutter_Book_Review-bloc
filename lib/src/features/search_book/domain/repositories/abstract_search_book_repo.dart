import 'package:bookreview/src/core/network/error/failures.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AbstractSearchBookRepo {
  Future<Either<Failure, SearchBookApiResponse>> searchNaverBooks(
    SearchBookParams params,
  );
}
