import 'package:flutter_recruitment_task/data/dtos/genre_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsDto {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<GenreDto>? genres;
  final int? id;
  final String? imdbId;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final int? revenue;
  final String? tagline;
  final String? title;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailsDto({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) => _$MovieDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsDtoToJson(this);
}
