// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
  bookId: json['bookId'] as String?,
  reviewerId: json['reviewerId'] as String?,
  review: json['review'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
  book: json['book'] == null
      ? null
      : SearchBookModel.fromJson(json['book'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'bookId': instance.bookId,
      'reviewerId': instance.reviewerId,
      'review': instance.review,
      'rating': instance.rating,
      'book': instance.book?.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
