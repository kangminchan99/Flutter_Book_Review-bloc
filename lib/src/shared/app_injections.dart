import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_auth_repo.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:bookreview/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/app_data_load_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/init_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/upload_cubit.dart';
import 'package:firebase_storage/firebase_storage.dart';

initAppInjections() {
  final storage = FirebaseStorage.instance;
  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<AppDataLoadCubit>(() => AppDataLoadCubit());
  sl.registerFactory<InitCubit>(() => InitCubit());
  sl.registerLazySingleton<AuthCubit>(
    () => AuthCubit(sl<AbstractAuthRepo>(), sl<AbstractUserRepo>()),
  );
  sl.registerLazySingleton<SignUpCubit>(
    () => SignUpCubit(sl<AuthCubit>().state.user!, sl<AbstractUserRepo>()),
  );
  sl.registerLazySingleton<UploadCubit>(() => UploadCubit(storage));
}
