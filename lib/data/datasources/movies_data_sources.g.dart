// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_data_sources.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _MoviesDataSources implements MoviesDataSources {
  _MoviesDataSources(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<MovieListDto> searchMovies(query) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieListDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/search/movie',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieListDto.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieDetailsDto> getMovieDetails(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MovieDetailsDto>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/movie/${id}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieDetailsDto.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
