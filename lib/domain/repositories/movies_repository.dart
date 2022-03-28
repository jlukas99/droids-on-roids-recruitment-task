import '../models/movie_list.dart';

abstract class MoviesRepository {
  Future<MovieList> searchMovies(String query);
}
