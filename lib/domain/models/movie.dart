class Movie {
  final String title;
  final String? backdropUrl;
  final String? posterUrl;
  final double voteAverage;
  final DateTime? releaseDate;
  final int id;

  Movie({
    required this.title,
    required this.backdropUrl,
    required this.posterUrl,
    required this.voteAverage,
    required this.releaseDate,
    required this.id,
  });
}
