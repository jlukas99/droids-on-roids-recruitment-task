// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsDto _$MovieDetailsDtoFromJson(Map<String, dynamic> json) => MovieDetailsDto(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      budget: json['budget'] as int?,
      genres: (json['genres'] as List<dynamic>?)?.map((e) => GenreDto.fromJson(e as Map<String, dynamic>)).toList(),
      id: json['id'] as int?,
      imdbId: json['imdb_id'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] == null || json['release_date'].isEmpty
          ? null
          : DateTime.parse(json['release_date'] as String),
      revenue: json['revenue'] as int?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] as int?,
    );

Map<String, dynamic> _$MovieDetailsDtoToJson(MovieDetailsDto instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate?.toIso8601String(),
      'revenue': instance.revenue,
      'tagline': instance.tagline,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
