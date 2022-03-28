import 'package:flutter/material.dart';
import 'package:flutter_recruitment_task/presentation/router/router.gr.dart';

import 'presentation/app/movie_app.dart';

void main() {
  final appRouter = AppRouter();

  return runApp(MovieApp(appRouter));
}
