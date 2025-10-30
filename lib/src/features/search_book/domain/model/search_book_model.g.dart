// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBookModel _$SearchBookModelFromJson(Map<String, dynamic> json) =>
    SearchBookModel(
      title: json['title'] as String?,
      link: json['link'] as String?,
      image: json['image'] as String?,
      author: json['author'] as String?,
      discount: json['discount'] as String?,
      publisher: json['publisher'] as String?,
      pubdate: json['pubdate'] as String?,
      isbn: json['isbn'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SearchBookModelToJson(SearchBookModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'image': instance.image,
      'author': instance.author,
      'discount': instance.discount,
      'publisher': instance.publisher,
      'pubdate': instance.pubdate,
      'isbn': instance.isbn,
      'description': instance.description,
    };
