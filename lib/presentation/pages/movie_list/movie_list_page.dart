import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/cubit/movie_list_cubit.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import '../../../domain/models/movie.dart';
import 'movie_card.dart';
import 'search_box.dart';

class MovieListPage extends HookWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<MovieListCubit>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.movie_creation_outlined),
            onPressed: () {
              //TODO implement navigation
            },
          ),
        ],
        title: Text('Movie Browser'),
      ),
      body: Column(
        children: <Widget>[
          SearchBox(onSubmitted: cubit.searchMovies),
          Expanded(child: _BuildContent(cubit)),
        ],
      ),
    );
  }
}

class _BuildContent extends HookWidget {
  final MovieListCubit _cubit;
  const _BuildContent(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useCubitBuilder(_cubit);

    return state.maybeMap(
      orElse: () => Center(
        child: Text('Movie browser'),
      ),
      fetch: (_) => Center(
        child: CircularProgressIndicator(),
      ),
      fetched: (e) => _buildMoviesList(e.movies),
      error: (e) => Center(
        child: Text(e.err),
      ),
    );
  }

  Widget _buildMoviesList(List<Movie> movies) => ListView.separated(
        separatorBuilder: (context, index) => Container(
          height: 1.0,
          color: Colors.grey.shade300,
        ),
        itemBuilder: (context, index) => MovieCard(
          title: movies[index].title,
          rating: '${(movies[index].voteAverage * 10).toInt()}%',
          onTap: () {},
        ),
        itemCount: movies.length,
      );
}
