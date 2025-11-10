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

  const SearchBookApiResponse.init()
    : this(start: 1, display: 10, items: const []);

  const SearchBookApiResponse({
    this.total,
    this.start,
    this.display,
    this.items,
  });

  @override
  List<Object?> get props => [total, start, display, items];

  SearchBookApiResponse copyWith({
    int? total,
    int? start,
    int? display,
    List<SearchBookModel>? items,
  }) {
    return SearchBookApiResponse(
      total: total ?? this.total,
      start: start ?? this.start,
      display: display ?? this.display,
      // paginate 할 때 기존 아이템에 새 아이템을 추가
      items: [...this.items ?? [], ...?items],
    );
  }

  factory SearchBookApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchBookApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchBookApiResponseToJson(this);
}
