import 'package:flutter_recruitment_task/app/utils/data_mapper.dart';
import 'package:flutter_recruitment_task/data/dtos/movie_dto.dart';
import 'package:flutter_recruitment_task/domain/models/movie.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieDtoMapper implements DataMapper<MovieDto, Movie> {
  @override
  Movie call(MovieDto data) {
    return Movie(
      title: data.title,
      voteAverage: data.voteAverage,
      id: data.id,
    );
  }
}
