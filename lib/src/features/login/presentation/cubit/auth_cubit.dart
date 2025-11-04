import 'dart:developer';

import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_auth_repo.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { init, authenticated, unauthenticated, unknown, error }

class AuthCubit extends Cubit<AuthState> with ChangeNotifier {
  final AbstractAuthRepo _authRepo;
  final AbstractUserRepo _userRepo;
  AuthCubit(this._authRepo, this._userRepo) : super(AuthState());

  // splash 화면에서 auth 상태를 체크할 때 구독
  void init() {
    _authRepo.user.listen((user) {
      _userStateChangedEvent(user);
    });
  }

  Future<void> _userStateChangedEvent(UserModel? user) async {
    if (user == null) {
      // 로그아웃 상태
      emit(state.copyWith(status: AuthStatus.unknown));
    } else {
      // 로그인 상태
      var result = await _userRepo.findUserOne(user.uid!);
      if (result == null) {
        emit(state.copyWith(user: user, status: AuthStatus.unauthenticated));
      } else {
        emit(state.copyWith(user: result, status: AuthStatus.authenticated));
      }
    }
    notifyListeners();
  }

  Future<void> googleLogin() async {
    await _authRepo.signInWithGoogle();
  }

  Future<void> appleLogin() async {
    await _authRepo.signInWithApple();
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    log('AuthCubit 상태 변경: ${change.currentState} -> ${change.nextState}');
  }
}

class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel? user;
  const AuthState({this.status = AuthStatus.init, this.user});

  AuthState copyWith({AuthStatus? status, UserModel? user}) {
    return AuthState(status: status ?? this.status, user: user ?? this.user);
  }

  @override
  List<Object?> get props => [status, user];
}
