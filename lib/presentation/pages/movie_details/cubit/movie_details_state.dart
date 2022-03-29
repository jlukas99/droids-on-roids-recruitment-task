part of 'movie_details_cubit.dart';

@freezed
class MovieDetailsState with _$MovieDetailsState {
  const factory MovieDetailsState.initial() = _Initial;
  const factory MovieDetailsState.fetch() = _Fetch;
  const factory MovieDetailsState.fetched(MovieDetails movieDetails) = _Fetched;
  const factory MovieDetailsState.error(String err) = _Error;
}
