import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:bookreview/src/shared/presentation/cubit/app_data_load_cubit.dart';

initAppInjections() {
  sl.registerFactory<SplashCubit>(() => SplashCubit());
  sl.registerFactory<AppDataLoadCubit>(() => AppDataLoadCubit());
}
