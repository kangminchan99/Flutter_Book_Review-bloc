import 'package:flutter_bloc/flutter_bloc.dart';

enum LoadStatus {
  dataLoad('데이터 로드'),
  authCheck('로그인 체크');

  const LoadStatus(this.message);
  final String message;
}

class SplashCubit extends Cubit<LoadStatus> {
  SplashCubit() : super(LoadStatus.dataLoad);

  changeLoadStatus(LoadStatus status) {
    emit(status);
  }
}
