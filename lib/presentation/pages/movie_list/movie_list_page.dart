import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/cubit/movie_list_cubit.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/widgets/search_box.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_dimens.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import '../../../domain/models/movie.dart';
import 'widgets/movie_card.dart';

class MovieListPage extends HookWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<MovieListCubit>();
    final state = useCubitBuilder(cubit);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            floating: true,
            snap: true,
            title: SearchBox(
              onSubmitted: cubit.searchMovies,
              onSelectedSort: cubit.sortMovies,
            ),
          ),
          state.maybeMap(
            orElse: () => _BuildContent(cubit),
            fetched: (e) => _SliverMovieList(e.movies),
          ),
        ],
      ),
    );
  }
}

class _SliverMovieList extends StatelessWidget {
  final List<Movie> movies;

  const _SliverMovieList(
    this.movies, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: false,
      sliver: SliverPadding(
        padding: const EdgeInsets.all(AppDimens.s),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => MovieCard(movies[index]),
            childCount: movies.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 16,
          ),
        ),
      ),
    );
  }
}

class _BuildContent extends StatelessWidget {
  final MovieListCubit _cubit;
  const _BuildContent(this._cubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: FadeIn(
        duration: const Duration(milliseconds: 375),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.m),
          child: _cubit.state.maybeMap(
            orElse: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_movies,
                  color: Theme.of(context).cardColor,
                  size: AppDimens.xxl,
                ),
                const SizedBox(height: AppDimens.m),
                Text(
                  "Search movies for Droids",
                  style: AppTypography.subTitle.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
            fetch: (_) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            error: (e) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.search_off_rounded,
                  color: Theme.of(context).cardColor,
                  size: AppDimens.xxl,
                ),
                const SizedBox(height: AppDimens.m),
                Text(
                  e.err,
                  style: AppTypography.subTitle.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
