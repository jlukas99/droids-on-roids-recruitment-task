import 'package:flutter_recruitment_task/data/dtos/movie_list_dto.dart';
import 'package:flutter_recruitment_task/data/mappers/movie_dto_mapper.dart';
import 'package:flutter_recruitment_task/domain/models/movie.dart';
import 'package:flutter_recruitment_task/domain/models/movie_list.dart';
import 'package:injectable/injectable.dart';

import '../../app/utils/data_mapper.dart';

@injectable
class MovieListDtoMapper implements DataMapper<MovieListDto, MovieList> {
  final MovieDtoMapper _movieDtoMapper;

  const MovieListDtoMapper(this._movieDtoMapper);

  @override
  MovieList call(MovieListDto data) {
    return MovieList(
      totalResults: data.totalResults,
      results: data.results.map<Movie>(_movieDtoMapper).toList(),
    );
  }
}
