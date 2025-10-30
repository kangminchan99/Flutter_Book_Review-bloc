// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookApiResponse _$SearchBookApiResponseFromJson(
  Map<String, dynamic> json,
) => SearchBookApiResponse(
  total: (json['total'] as num?)?.toInt(),
  start: (json['start'] as num?)?.toInt(),
  display: (json['display'] as num?)?.toInt(),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => SearchBookModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SearchBookApiResponseToJson(
  SearchBookApiResponse instance,
) => <String, dynamic>{
  'total': instance.total,
  'start': instance.start,
  'display': instance.display,
  'items': instance.items,
};
