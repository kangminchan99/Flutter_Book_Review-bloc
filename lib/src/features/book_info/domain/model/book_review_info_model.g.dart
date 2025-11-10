// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_review_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookReviewInfoModel _$BookReviewInfoModelFromJson(Map<String, dynamic> json) =>
    BookReviewInfoModel(
      bookInfo: json['bookInfo'] == null
          ? null
          : SearchBookModel.fromJson(json['bookInfo'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      bookId: json['bookId'] as String?,
      totalRating: (json['totalRating'] as num?)?.toDouble(),
      reviewerIds: (json['reviewerIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$BookReviewInfoModelToJson(
  BookReviewInfoModel instance,
) => <String, dynamic>{
  'bookInfo': instance.bookInfo?.toJson(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'bookId': instance.bookId,
  'totalRating': instance.totalRating,
  'reviewerIds': instance.reviewerIds,
};
