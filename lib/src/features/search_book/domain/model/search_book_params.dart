import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_book_params.g.dart';

enum NaverBookSortType {
  date('출간일순', 'date'),
  sim('정확도순', 'sim');

  const NaverBookSortType(this.name, this.value);

  final String name;
  final String value;
}

@JsonSerializable()
class SearchBookParams extends Equatable {
  final String? query;
  final int? display;
  final int? start;
  final NaverBookSortType? sort;

  const SearchBookParams.init({required String query})
    : this(query: query, display: 10, start: 1, sort: NaverBookSortType.date);

  const SearchBookParams({this.query, this.display, this.start, this.sort});

  @override
  List<Object?> get props => [query, display, start, sort];

  Map<String, dynamic> toMap() => _$SearchBookParamsToJson(this);
}
