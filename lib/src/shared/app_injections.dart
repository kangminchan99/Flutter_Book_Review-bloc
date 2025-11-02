import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_auth_repo.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:bookreview/src/features/login/presentation/cubit/auth_cubit.dart';
import 'package:bookreview/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/app_data_load_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/init_cubit.dart';

initAppInjections() {
  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<AppDataLoadCubit>(() => AppDataLoadCubit());
  sl.registerFactory<InitCubit>(() => InitCubit());
  sl.registerFactory<AuthCubit>(
    () => AuthCubit(sl<AbstractAuthRepo>(), sl<AbstractUserRepo>()),
  );
}
