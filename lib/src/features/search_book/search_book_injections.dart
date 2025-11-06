import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/core/network/dio_network.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/remote/search_book_impl_api.dart';
import 'package:bookreview/src/features/search_book/data/data_sources/repositories/search_book_repo_impl.dart';
import 'package:bookreview/src/features/search_book/domain/repositories/abstract_search_book_repo.dart';

initSearchBookInjections() {
  sl.registerSingleton<SearchBookImplApi>(SearchBookImplApi(DioNetwork.appAPI));
  sl.registerSingleton<AbstractSearchBookRepo>(
    SearchBookRepoImpl(sl<SearchBookImplApi>()),
  );
}
