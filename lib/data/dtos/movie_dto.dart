import 'package:json_annotation/json_annotation.dart';

part 'movie_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDto {
  @JsonKey(name: "poster_path")
  final String? posterUrl;
  @JsonKey(name: "backdrop_path")
  final String? backdropUrl;
  final String title;
  final double voteAverage;
  final DateTime? releaseDate;
  final int id;

  MovieDto({
    required this.posterUrl,
    required this.backdropUrl,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.id,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) => _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
