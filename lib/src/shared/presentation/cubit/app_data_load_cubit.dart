import 'package:bookreview/src/shared/domain/entities/common_state_status_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDataLoadCubit extends Cubit<AppDataLoadState> {
  AppDataLoadCubit() : super(AppDataLoadState()) {
    _loadData();
  }

  void _loadData() async {
    emit(state.copyWith(status: CommonStateStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: CommonStateStatus.loaded));
  }
}

class AppDataLoadState extends Equatable {
  final CommonStateStatus status;
  const AppDataLoadState({this.status = CommonStateStatus.init});

  AppDataLoadState copyWith({CommonStateStatus? status}) {
    return AppDataLoadState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
