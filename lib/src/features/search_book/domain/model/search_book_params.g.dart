// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookParams _$SearchBookParamsFromJson(Map<String, dynamic> json) =>
    SearchBookParams(
      query: json['query'] as String?,
      display: (json['display'] as num?)?.toInt(),
      start: (json['start'] as num?)?.toInt(),
      sort: $enumDecodeNullable(_$NaverBookSortTypeEnumMap, json['sort']),
    );

Map<String, dynamic> _$SearchBookParamsToJson(SearchBookParams instance) =>
    <String, dynamic>{
      'query': instance.query,
      'display': instance.display,
      'start': instance.start,
      'sort': _$NaverBookSortTypeEnumMap[instance.sort],
    };

const _$NaverBookSortTypeEnumMap = {
  NaverBookSortType.date: 'date',
  NaverBookSortType.sim: 'sim',
};
