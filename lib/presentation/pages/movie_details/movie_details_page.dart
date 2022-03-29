import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_recruitment_task/domain/models/movie.dart';
import 'package:flutter_recruitment_task/domain/models/movie_details.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/cubit/movie_details_cubit.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_colors.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_typography.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_dimens.dart';
import '../../widgets/custom_button.dart';

class MovieDetailsPage extends HookWidget {
  final Movie movie;

  const MovieDetailsPage({required this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = useCubit<MovieDetailsCubit>();
    final state = useCubitBuilder(cubit);

    useEffect(() {
      cubit.fetchDetails(movie);
    }, [cubit]);

    return Scaffold(
      /*appBar: AppBar(
            TODO: Here is it Task 3 - but it's not fit with my UI, so i commented it 😅
            title: Text(movie.title),
          ),*/
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _BackgroundImage(movie: movie),
          Positioned(
            top: 0,
            left: AppDimens.m,
            right: 0,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(color: AppColors.accent),
                  _VoteAverage(movie: movie),
                ],
              ),
            ),
          ),
          Positioned.fill(
            bottom: AppDimens.m,
            child: state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              //fetch: (_) => const _Loading(),
              error: (e) => _Error(movie: movie, error: e.err),
              fetched: (e) => FadeInUp(
                duration: const Duration(milliseconds: 375),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Spacer(flex: 5),
                    _Title(movie.title),
                    _Stars(e.movieDetails.voteAverage),
                    _Details(e.movieDetails),
                    Divider(
                      color: AppColors.accent,
                      indent: MediaQuery.of(context).size.width * 0.3,
                      endIndent: MediaQuery.of(context).size.width * 0.3,
                    ),
                    _Description(e.movieDetails.overview),
                    _BudgetAndRevenue(e.movieDetails),
                    //TODO: And the last Task 4 - UI!
                    _WatchToday(e.movieDetails.watchToday),
                    _CheckOnIMDb(e.movieDetails.imdbId),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _Loading extends StatelessWidget {
//   const _Loading({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: [
//           const Spacer(flex: 15),
//           CircularProgressIndicator(
//             color: AppColors.accent,
//           ),
//           const SizedBox(height: AppDimens.m),
//           Text(
//             "Loading movie details...",
//             style: AppTypography.paragraphs.copyWith(
//               color: Theme.of(context).cardColor,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const Spacer(),
//         ],
//       ),
//     );
//   }
// }

class _Error extends StatelessWidget {
  final String error;
  final Movie movie;
  const _Error({
    Key? key,
    required this.movie,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 375),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            _Title(movie.title),
            const Spacer(),
            Icon(
              Icons.error_rounded,
              color: Theme.of(context).cardColor,
              size: AppDimens.xxl,
            ),
            const SizedBox(height: AppDimens.m),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
              child: Text(
                error,
                style: AppTypography.subTitle.copyWith(
                  color: Theme.of(context).cardColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppDimens.m),
            Padding(
              padding: const EdgeInsets.all(AppDimens.m),
              child: CustomButton(
                onTap: () => AutoRouter.of(context).pop(),
                text: "Back to main page",
              ),
            ),
            const SizedBox(height: AppDimens.m),
          ],
        ),
      ),
    );
  }
}

class _WatchToday extends StatelessWidget {
  final bool? watchToday;

  const _WatchToday(this.watchToday, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.m),
      child: Column(
        children: [
          Text(
            "Should I watch it today?",
            style: AppTypography.paragraphs.copyWith(
              color: AppColors.icon,
            ),
          ),
          Text(
            watchToday! ? "Yes, definitely!" : "No!",
            style: AppTypography.subTitle.copyWith(
              color: watchToday! ? AppColors.accent : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetAndRevenue extends StatelessWidget {
  final MovieDetails movieDetails;

  const _BudgetAndRevenue(
    this.movieDetails, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Also Task 3!
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _item(text: "budget", value: movieDetails.budget, rtl: true),
        Container(
          width: 1,
          height: AppDimens.xl,
          color: AppColors.accent,
          margin: const EdgeInsets.symmetric(horizontal: AppDimens.m),
        ),
        _item(text: "revenue", value: movieDetails.revenue),
      ],
    );
  }

  Widget _item({required String text, required int value, bool rtl = false}) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: rtl ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            NumberFormat.compactCurrency(symbol: "\$").format(value),
            style: AppTypography.paragraphs.copyWith(color: rtl ? Colors.white : AppColors.accent),
          ),
          Text(
            text,
            style: AppTypography.small.copyWith(color: AppColors.icon, height: 1),
          ),
        ],
      );
}

class _Description extends StatelessWidget {
  final String? overview;

  const _Description(
    this.overview, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: overview?.isNotEmpty ?? false,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.m),
        child: Text(
          overview ?? '',
          style: AppTypography.small,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _CheckOnIMDb extends StatelessWidget {
  final String? imdbId;

  const _CheckOnIMDb(
    this.imdbId, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Visibility(
        visible: imdbId?.isNotEmpty ?? false,
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.m),
          child: CustomButton(
            onTap: () => launch("https://www.imdb.com/title/$imdbId"),
            text: "Check on IMDb",
          ),
        ),
      ),
    );
  }
}

class _VoteAverage extends StatelessWidget {
  final Movie movie;

  const _VoteAverage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInRight(
      duration: const Duration(milliseconds: 375),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(AppDimens.s),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.xm, vertical: AppDimens.xs),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star_rounded,
                size: AppDimens.ml,
                color: Colors.white,
              ),
              const SizedBox(width: AppDimens.xs),
              Text(
                "${(movie.voteAverage * 10).toInt()}%",
                style: AppTypography.paragraphs.copyWith(
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

class _Title extends StatelessWidget {
  final String title;

  const _Title(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.m),
      child: Text(
        title,
        style: AppTypography.title,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  final double voteAverage;

  const _Stars(
    this.voteAverage, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        (voteAverage * 0.5).round(),
        (index) => Padding(
          padding: const EdgeInsets.all(AppDimens.xxs),
          child: Icon(
            Icons.star,
            color: AppColors.primary,
            size: AppDimens.xl,
          ),
        ),
      ),
    );
  }
}

class _Details extends StatelessWidget {
  final MovieDetails movieDetails;

  const _Details(this.movieDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _DetailsItem(movieDetails.releaseDate != null ? DateFormat.y().format(movieDetails.releaseDate!) : ""),
        _DetailsItem(movieDetails.adult ? "+18" : ""),
        _DetailsItem(
          movieDetails.genres.getRange(0, movieDetails.genres.length > 1 ? 2 : movieDetails.genres.length).join(" / "),
        ),
      ],
    );
  }
}

class _DetailsItem extends StatelessWidget {
  final String? text;
  const _DetailsItem(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: text != null && text!.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.s),
        child: Text(
          text ?? '',
          style: AppTypography.paragraphs,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      bottom: MediaQuery.of(context).size.height * 0.3,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.transparent,
              Colors.black,
            ],
            stops: [0.0, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstOut,
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
      ),
    );
  }
}
