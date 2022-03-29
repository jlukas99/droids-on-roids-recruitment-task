import 'package:flutter_recruitment_task/domain/models/movie_details.dart';

import '../models/movie_list.dart';

abstract class MoviesRepository {
  Future<MovieList> searchMovies(String query);
  Future<MovieDetails> getMovieDetails(int id);
}
