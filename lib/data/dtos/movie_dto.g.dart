// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      posterUrl: json['poster_path'] as String?,
      backdropUrl: json['backdrop_path'] as String?,
      title: json['title'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] == null || json['release_date'].isEmpty
          ? null
          : DateTime.parse(json['release_date'] as String),
      id: json['id'] as int,
    );

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) => <String, dynamic>{
      'poster_path': instance.posterUrl,
      'backdrop_path': instance.backdropUrl,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate?.toIso8601String(),
      'id': instance.id,
    };
