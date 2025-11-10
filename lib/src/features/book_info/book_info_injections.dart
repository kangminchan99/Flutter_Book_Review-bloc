import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/book_info/data/repositories/book_review_info_repo_impl.dart';
import 'package:bookreview/src/features/book_info/domain/repositories/abstract_book_review_info_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

initBookInfoInjections({required FirebaseFirestore db}) {
  sl.registerSingleton<AbstractBookReviewInfoRepo>(BookReviewInfoRepoImpl(db));
}
