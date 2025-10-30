import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/network/dio_network.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/remote/search_book_impl_api.dart';

initSearchBookInjections() {
  sl.registerSingleton<SearchBookImplApi>(SearchBookImplApi(DioNetwork.appAPI));
}
