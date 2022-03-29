class Api {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = String.fromEnvironment('apiKey');

  //GET
  static const searchMovie = "/search/movie";
  static const movieDetails = "/movie/{id}";
}
