import 'package:bookreview/src/core/injections.dart';
import 'package:bookreview/src/features/review/domain/model/review_model.dart';
import 'package:bookreview/src/features/review/domain/repositories/abstract_review_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileReviewCubit extends Cubit<ProfileReviewState> {
  final String uid;
  ProfileReviewCubit(this.uid) : super(ProfileReviewState()) {
    _loadUserReviews();
  }

  void _loadUserReviews() async {
    var result = await sl<AbstractReviewRepo>().loadUserReviews(uid);
    emit(state.copyWith(reviews: result));
  }
}

class ProfileReviewState extends Equatable {
  final List<ReviewModel> reviews;
  const ProfileReviewState({this.reviews = const []});

  ProfileReviewState copyWith({List<ReviewModel>? reviews}) {
    return ProfileReviewState(reviews: reviews ?? this.reviews);
  }

  @override
  List<Object?> get props => [reviews];
}
