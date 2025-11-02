import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/data/repositories/auth_repo_impl.dart';
import 'package:bookreview/src/features/login/data/repositories/user_repo_impl.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_auth_repo.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

initLoginInjections() {
  var db = FirebaseFirestore.instance;
  sl.registerSingleton<AbstractAuthRepo>(AuthRepoImpl(FirebaseAuth.instance));
  sl.registerSingleton<AbstractUserRepo>(UserRepoImpl(db));
}
