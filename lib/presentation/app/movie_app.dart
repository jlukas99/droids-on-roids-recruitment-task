import 'package:flutter/material.dart';

import '../router/router.gr.dart';

class MovieApp extends StatelessWidget {
  final AppRouter appRouter;

  const MovieApp(this.appRouter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      );
}
