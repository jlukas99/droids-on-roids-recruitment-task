import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_colors.dart';
import 'package:flutter_recruitment_task/presentation/theme/app_theme.dart';

import '../presentation/router/router.gr.dart';

class MovieApp extends StatelessWidget {
  final AppRouter appRouter;

  const MovieApp(this.appRouter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: AppTheme.darkTheme,
        color: AppColors.primary,
      );
}
