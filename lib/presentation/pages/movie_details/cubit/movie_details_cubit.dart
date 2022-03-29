import 'package:bloc/bloc.dart';
import 'package:flutter_recruitment_task/domain/models/movie.dart';
import 'package:flutter_recruitment_task/domain/models/movie_details.dart';
import 'package:flutter_recruitment_task/domain/usecases/get_movie_details_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_details_state.dart';
part 'movie_details_cubit.freezed.dart';

@injectable
class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final GetMovieDetailsUseCase _getMovieDetailsUseCase;

  MovieDetailsCubit(this._getMovieDetailsUseCase) : super(const MovieDetailsState.initial());

  void fetchDetails(Movie movie) async {
    emit(const MovieDetailsState.fetch());

    try {
      final result = await _getMovieDetailsUseCase(movie.id);
      emit(MovieDetailsState.fetched(result));
    } catch (e) {
      return emit(MovieDetailsState.error(e.toString()));
    }
  }
}
