class MovieDetails {
  final bool adult;
  final String? backdropPath;
  final int budget;
  final List<String> genres;
  final int id;
  final String? imdbId;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final int revenue;
  final String? tagline;
  final String title;
  final double voteAverage;
  final int voteCount;
  final bool? watchToday;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    this.watchToday,
  });

  MovieDetails copyWith({
    bool? adult,
    String? backdropPath,
    int? budget,
    List<String>? genres,
    int? id,
    String? imdbId,
    String? overview,
    double? popularity,
    String? posterPath,
    DateTime? releaseDate,
    int? revenue,
    String? tagline,
    String? title,
    double? voteAverage,
    int? voteCount,
    bool? watchToday,
  }) {
    return MovieDetails(
      adult: adult ?? this.adult,
      backdropPath: backdropPath ?? this.backdropPath,
      budget: budget ?? this.budget,
      genres: genres ?? this.genres,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      revenue: revenue ?? this.revenue,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      watchToday: watchToday ?? this.watchToday,
    );
  }
}
