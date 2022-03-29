import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreDto {
  final int? id;
  final String name;

  GenreDto({
    required this.id,
    required this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) => _$GenreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDtoToJson(this);
}
