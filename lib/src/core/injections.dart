// 초기 고정 세팅 값
import 'package:bookreview/src/core/network/dio_network.dart';
import 'package:bookreview/src/core/utils/log/app_logger.dart';
import 'package:bookreview/src/features/login/login_injections.dart';
import 'package:bookreview/src/features/search_book/search_book_injections.dart';
import 'package:bookreview/src/shared/app_injections.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initAppInjections();
  await initLoginInjections();
  await initSearchBookInjections();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
