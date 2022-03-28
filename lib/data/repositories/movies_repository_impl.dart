import 'package:flutter_recruitment_task/data/mappers/movie_list_dto_mapper.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_recruitment_task/data/datasources/movies_data_sources.dart';
import 'package:flutter_recruitment_task/domain/repositories/movies_repository.dart';

import '../../domain/models/movie_list.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDataSources _moviesDataSources;
  final MovieListDtoMapper _movieListDtoMapper;

  const MoviesRepositoryImpl(
    this._moviesDataSources,
    this._movieListDtoMapper,
  );

  @override
  Future<MovieList> searchMovies(String query) async {
    return _movieListDtoMapper(await _moviesDataSources.searchMovies(query));
  }
}
