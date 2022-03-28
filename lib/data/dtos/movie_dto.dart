import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDto {
  final String title;
  final double voteAverage;
  final int id;

  MovieDto({
    required this.title,
    required this.voteAverage,
    required this.id,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
