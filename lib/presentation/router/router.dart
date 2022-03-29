import 'package:auto_route/auto_route.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_details/movie_details_page.dart';
import 'package:flutter_recruitment_task/presentation/pages/movie_list/movie_list_page.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(
      initial: true,
      page: MovieListPage,
    ),
    AutoRoute(page: MovieDetailsPage),
  ],
)
class $AppRouter {}
