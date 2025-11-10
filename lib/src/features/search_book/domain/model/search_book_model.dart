import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_book_model.g.dart';

@JsonSerializable()
class SearchBookModel extends Equatable {
  final String? title;
  final String? link;
  final String? image;
  final String? author;
  final String? discount;
  final String? publisher;
  final String? pubdate;
  final String? isbn;
  final String? description;

  const SearchBookModel({
    this.title,
    this.link,
    this.image,
    this.author,
    this.discount,
    this.publisher,
    this.pubdate,
    this.isbn,
    this.description,
  });

  @override
  List<Object?> get props => [
    title,
    link,
    image,
    author,
    discount,
    publisher,
    pubdate,
    isbn,
    description,
  ];

  factory SearchBookModel.fromJson(Map<String, dynamic> json) =>
      _$SearchBookModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBookModelToJson(this);
}
