import 'package:flutter_recruitment_task/app/utils/data_mapper.dart';
import 'package:flutter_recruitment_task/data/dtos/movie_details_dto.dart';
import 'package:flutter_recruitment_task/domain/models/movie_details.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDetailsDtoMapper implements DataMapper<MovieDetailsDto, MovieDetails> {
  @override
  MovieDetails call(MovieDetailsDto data) {
    return MovieDetails(
      adult: data.adult ?? false,
      backdropPath: data.backdropPath,
      budget: data.budget ?? 0,
      genres: data.genres?.map((e) => e.name).toList() ?? [],
      id: data.id!,
      imdbId: data.imdbId,
      overview: data.overview,
      popularity: data.popularity ?? 0,
      posterPath: data.posterPath,
      releaseDate: data.releaseDate,
      revenue: data.revenue ?? 0,
      tagline: data.tagline,
      title: data.title ?? '',
      voteAverage: data.voteAverage ?? 0,
      voteCount: data.voteCount ?? 0,
    );
  }
}
