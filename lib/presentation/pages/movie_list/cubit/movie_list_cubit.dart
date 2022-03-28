import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/domain/usecases/search_movies_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/movie.dart';

part 'movie_list_state.dart';
part 'movie_list_cubit.freezed.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  MovieListCubit(this._searchMoviesUseCase) : super(MovieListState.initial());

  void searchMovies(String query) async {
    emit(MovieListState.fetch());

    var movies = <Movie>[];

    try {
      movies = await _searchMoviesUseCase(query);

      if (movies.isEmpty) throw 'Nothing found';
    } catch (e) {
      return emit(MovieListState.error(e.toString()));
    }

    //Task 1 - sort by vote average.
    movies = movies.sortedBy<num>((element) => element.voteAverage);

    //Movies from best to worst
    movies = movies.reversed.toList();

    emit(MovieListState.fetched(movies));
  }
}
