part of 'movie_list_cubit.dart';

@freezed
class MovieListState with _$MovieListState {
  const factory MovieListState.initial() = _Initial;
  const factory MovieListState.fetch() = _Fetch;
  const factory MovieListState.fetched(List<Movie> movies) = _Fetched;
  const factory MovieListState.error(String err) = _Error;
}
