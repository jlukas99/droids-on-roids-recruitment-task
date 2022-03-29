import 'package:flutter_recruitment_task/data/mappers/movie_details_dto_mapper.dart';
import 'package:flutter_recruitment_task/data/mappers/movie_list_dto_mapper.dart';
import 'package:flutter_recruitment_task/domain/models/movie_details.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_recruitment_task/data/datasources/movies_data_sources.dart';
import 'package:flutter_recruitment_task/domain/repositories/movies_repository.dart';

import '../../domain/models/movie_list.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSources _moviesDataSources;
  final MovieListDtoMapper _movieListDtoMapper;
  final MovieDetailsDtoMapper _movieDetailsDtoMapper;

  const MoviesRepositoryImpl(
    this._moviesDataSources,
    this._movieListDtoMapper,
    this._movieDetailsDtoMapper,
  );

  @override
  Future<MovieList> searchMovies(String query) async {
    return _movieListDtoMapper(await _moviesDataSources.searchMovies(query));
  }

  @override
  Future<MovieDetails> getMovieDetails(int id) async {
    return _movieDetailsDtoMapper(await _moviesDataSources.getMovieDetails(id));
  }
}
