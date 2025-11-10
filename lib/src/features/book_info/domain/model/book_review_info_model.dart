import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_review_info_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookReviewInfoModel extends Equatable {
  final SearchBookModel? bookInfo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? bookId;
  final double? totalRating;
  final List<String>? reviewerIds;

  const BookReviewInfoModel({
    this.bookInfo,
    this.createdAt,
    this.updatedAt,
    this.bookId,
    this.totalRating,
    this.reviewerIds,
  });

  @override
  List<Object?> get props => [
    bookInfo,
    createdAt,
    updatedAt,
    bookId,
    totalRating,
    reviewerIds,
  ];

  BookReviewInfoModel copyWith({
    SearchBookModel? bookInfo,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? bookId,
    double? totalRating,
    List<String>? reviewerIds,
  }) {
    return BookReviewInfoModel(
      bookInfo: bookInfo ?? this.bookInfo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      bookId: bookId ?? this.bookId,
      totalRating: totalRating ?? this.totalRating,
      reviewerIds: reviewerIds ?? this.reviewerIds,
    );
  }

  factory BookReviewInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BookReviewInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookReviewInfoModelToJson(this);
}
