import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/review/data/repositories/review_repo_impl.dart';
import 'package:bookreview/src/features/review/domain/repositories/abstract_review_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

initReviewInjections({required FirebaseFirestore db}) {
  sl.registerSingleton<AbstractReviewRepo>(ReviewRepoImpl(db));
}
