import 'package:hydrated_bloc/hydrated_bloc.dart';

// 앱 최초 실행 여부 관리
class InitCubit extends HydratedCubit<bool> {
  InitCubit() : super(false);

  // 사용자가 스타트를 누르면 로컬 스토리지에 상태 저장
  void startApp() {
    emit(true);
  }

  // 저장할 상태를 JSON으로 변환하고 복원하는 메서드 구현
  @override
  bool fromJson(Map<String, dynamic> json) => json['state'] as bool;

  @override
  Map<String, dynamic> toJson(bool state) => {'state': state};
}
