import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/login/domain/model/user_model.dart';
import 'package:bookreview/src/features/login/domain/repositories/abstract_user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopReviewerCubit extends Cubit<TopReviewerState> {
  TopReviewerCubit() : super(TopReviewerState()) {
    _loadTopReviewers();
  }

  void _loadTopReviewers() async {
    var results = await sl<AbstractUserRepo>().loadTopReviewers();
    emit(state.copyWith(results: results));
  }

  void refresh() {
    _loadTopReviewers();
  }
}

class TopReviewerState extends Equatable {
  final List<UserModel>? results;
  const TopReviewerState({this.results = const []});

  TopReviewerState copyWith({List<UserModel>? results}) {
    return TopReviewerState(results: results ?? this.results);
  }

  @override
  List<Object?> get props => [results];
}
