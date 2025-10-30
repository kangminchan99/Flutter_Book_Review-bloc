import 'package:bookreview/src/features/search_book/domain/model/search_book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_book_response_model.g.dart';

@JsonSerializable()
class SearchBookApiResponse extends Equatable {
  final int? total;
  final int? start;
  final int? display;
  final List<SearchBookModel>? items;

  const SearchBookApiResponse({
    this.total,
    this.start,
    this.display,
    this.items,
  });

  @override
  List<Object?> get props => [total, start, display, items];

  factory SearchBookApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBookApiResponseFromJson(json);
}
