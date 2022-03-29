import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/domain/models/movie.dart';
import 'package:flutter_recruitment_task/presentation/router/router.gr.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_colors.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_dimens.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';
import 'package:intl/intl.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.s),
      child: CupertinoButton(
        minSize: 0,
        padding: EdgeInsets.zero,
        //TODO: Task 2 - Okey leeeet's go!
        onPressed: () => AutoRouter.of(context).push(MovieDetailsPageRoute(movie: movie)),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.xm),
                  color: Theme.of(context).cardColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.xm),
                  child: Stack(
                    children: [
                      _Image(movie: movie),
                      _ReleaseDate(movie: movie),
                      _VoteAverage(movie: movie),
                    ],
                  ),
                ),
              ),
            ),
            _Title(movie: movie),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.c,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.s),
        child: Text(
          movie.title,
          style: AppTypography.small.copyWith(
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _VoteAverage extends StatelessWidget {
  const _VoteAverage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(AppDimens.xm),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xm, vertical: AppDimens.xs),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: AppDimens.m,
                color: Colors.white,
              ),
              const SizedBox(width: AppDimens.xs),
              Text(
                "${(movie.voteAverage * 10).toInt()}%",
                style: AppTypography.small.copyWith(
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReleaseDate extends StatelessWidget {
  const _ReleaseDate({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: movie.releaseDate != null,
      replacement: const Positioned.fill(child: SizedBox.expand()),
      child: Positioned(
        left: 0,
        bottom: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(AppDimens.xm),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.xm, vertical: AppDimens.xs),
            child: Text(
              movie.releaseDate != null ? DateFormat.y().format(movie.releaseDate!) : "-",
              style: AppTypography.small,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: CachedNetworkImage(
        imageUrl:
            movie.posterUrl ?? 'https://printworks-manchester.com/cinema-poster/images/film-poster-placeholder.png',
        fit: BoxFit.cover,
        errorWidget: (context, _, __) => Icon(
          Icons.broken_image_rounded,
          color: AppColors.darkText,
          size: AppDimens.xl,
        ),
        progressIndicatorBuilder: (context, _, __) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.xm),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.accent),
              strokeWidth: 0.7,
            ),
          ),
        ),
      ),
    );
  }
}
