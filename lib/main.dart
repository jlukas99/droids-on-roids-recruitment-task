import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/injector.dart';
import 'package:flutter_recruitment_task/presentation/router/router.gr.dart';
import 'package:hooked_bloc/hooked_bloc.dart';

import 'app/movie_app.dart';

void main() async {
  await configureDependiences();

  HookedBloc.initialize(
    () => getIt.get,
    builderCondition: (state) => state != null,
    listenerCondition: (state) => state != null,
  );

  final appRouter = AppRouter();

  return runApp(MovieApp(appRouter));
}
