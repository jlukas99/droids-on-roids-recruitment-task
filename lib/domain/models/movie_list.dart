import 'movie.dart';

class MovieList {
  final int totalResults;
  final List<Movie> results;

  MovieList({
    required this.totalResults,
    required this.results,
  });
}
