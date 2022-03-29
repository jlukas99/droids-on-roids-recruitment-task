import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/app/utils/enums.dart';
import 'package:flutter_recruitment_task/domain/usecases/search_movies_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/movie.dart';

part 'movie_list_state.dart';
part 'movie_list_cubit.freezed.dart';

@injectable
class MovieListCubit extends Cubit<MovieListState> {
  final SearchMoviesUseCase _searchMoviesUseCase;

  MovieListCubit(this._searchMoviesUseCase) : super(const MovieListState.initial());

  var _movies = <Movie>[];
  var _sortType = SortType.dsc;

  void searchMovies(String query) async {
    if (query.isEmpty) return emit(const MovieListState.initial());

    emit(const MovieListState.fetch());

    try {
      _movies = await _searchMoviesUseCase(query);

      if (_movies.isEmpty) throw 'Nothing found';
    } catch (e) {
      return emit(MovieListState.error(e.toString()));
    }

    sortMovies(_sortType);
  }

  void sortMovies(SortType sortType) {
    _sortType = sortType;

    if (_movies.isNotEmpty) {
      switch (sortType) {
        case SortType.asc:
          emit(MovieListState.fetched(List.of(_movies.sortedBy<num>((element) => element.voteAverage))));
          break;
        case SortType.dsc:
          emit(MovieListState.fetched(List.of(_movies.sortedBy<num>((element) => element.voteAverage).reversed)));
          break;
        case SortType.alphabet:
          emit(MovieListState.fetched(List.of(_movies.sortedBy<String>((element) => element.title))));
          break;
      }
    }
  }
}
