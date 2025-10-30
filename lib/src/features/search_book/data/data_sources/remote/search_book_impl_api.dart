import 'package:bookreview/src/core/utils/constant/network_constant.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/remote/abstract_search_book_api.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_params.dart';
import 'package:bookreview/src/features/search_book/domain/model/search_book_response_model.dart';
import 'package:dio/dio.dart';

class SearchBookImplApi extends AbstractSearchBookApi {
  final Dio _dio;
  SearchBookImplApi(this._dio);

  @override
  Future<SearchBookApiResponse> searchNaverBooks(
    SearchBookParams params,
  ) async {
    var response = await _dio.get(
      getSearchBooksPath(),
      queryParameters: params.toMap(),
    );

    return SearchBookApiResponse.fromJson(response.data);
  }
}
