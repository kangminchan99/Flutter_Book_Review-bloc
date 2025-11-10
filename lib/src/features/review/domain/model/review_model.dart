import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

// explicitToJson - 중첩된 객체도 toJson 메서드를 호출하도록 설정
@JsonSerializable(explicitToJson: true)
class ReviewModel extends Equatable {
  final String? bookId;
  final String? reviewerId;
  final String? review;
  final double? rating;
  final SearchBookModel? book;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReviewModel({
    this.bookId,
    this.reviewerId,
    this.review,
    this.rating,
    this.book,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
    bookId,
    reviewerId,
    review,
    rating,
    book,
    createdAt,
    updatedAt,
  ];

  ReviewModel copyWith({
    String? bookId,
    String? reviewerId,
    String? review,
    double? rating,
    SearchBookModel? book,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReviewModel(
      bookId: bookId ?? this.bookId,
      reviewerId: reviewerId ?? this.reviewerId,
      review: review ?? this.review,
      rating: rating ?? this.rating,
      book: book ?? this.book,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
