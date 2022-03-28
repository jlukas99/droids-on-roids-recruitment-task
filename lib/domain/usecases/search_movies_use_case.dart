import 'package:injectable/injectable.dart';

import '../models/movie.dart';
import '../repositories/movies_repository.dart';

@injectable
class SearchMoviesUseCase {
  final MoviesRepository _moviesRepository;

  const SearchMoviesUseCase(this._moviesRepository);

  Future<List<Movie>> call(String query) async {
    var _result = await _moviesRepository.searchMovies(query);

    return _result.results;
  }
}
