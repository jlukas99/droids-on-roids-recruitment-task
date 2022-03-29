import 'package:flutter_recruitment_task/data/dtos/movie_details_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart' hide Headers;

import '../../app/config/api.dart';
import '../dtos/movie_list_dto.dart';

part 'movies_data_sources.g.dart';

@RestApi()
@injectable
abstract class MoviesDataSources {
  @factoryMethod
  factory MoviesDataSources(Dio dio) = _MoviesDataSources;

  @GET(Api.searchMovie)
  Future<MovieListDto> searchMovies(@Query('query') String query);

  @GET(Api.movieDetails)
  Future<MovieDetailsDto> getMovieDetails(@Path('id') int id);
}
