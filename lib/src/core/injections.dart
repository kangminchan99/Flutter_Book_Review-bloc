// 초기 고정 세팅 값
import 'package:bookreview/src/core/network/dio_network.dart';
import 'package:bookreview/src/core/utils/log/app_logger.dart';
import 'package:bookreview/src/features/book_info/book_info_injections.dart';
import 'package:bookreview/src/features/login/login_injections.dart';
import 'package:bookreview/src/features/review/review_injections.dart';
import 'package:bookreview/src/features/search_book/search_book_injections.dart';
import 'package:bookreview/src/shared/app_injections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
var db = FirebaseFirestore.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initAppInjections();
  await initLoginInjections(db: db);
  await initReviewInjections(db: db);
  await initBookInfoInjections(db: db);
  await initSearchBookInjections();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
