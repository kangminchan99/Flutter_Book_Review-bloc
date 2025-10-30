import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';

abstract class AbstractSearchBookApi {
  Future<SearchBookApiResponse> searchNaverBooks(SearchBookParams params);
}
