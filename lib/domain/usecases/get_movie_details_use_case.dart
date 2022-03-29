import 'package:flutter_recruitment_task/domain/models/movie_details.dart';
import 'package:injectable/injectable.dart';

import '../repositories/movies_repository.dart';

@injectable
class GetMovieDetailsUseCase {
  final MoviesRepository _moviesRepository;

  const GetMovieDetailsUseCase(this._moviesRepository);

  Future<MovieDetails> call(int id) async {
    var movieDetails = await _moviesRepository.getMovieDetails(id);

    //TODO: And the last Task 4 - logic!
    return movieDetails.copyWith(
      watchToday: movieDetails.revenue - movieDetails.budget > 1000000 && DateTime.now().weekday == DateTime.sunday,
    );
  }
}
