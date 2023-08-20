class ApiConstance {
  static const baseUrl = "https://api.themoviedb.org/3";

  static const apiKey = "bc57751025d1494691d01f49a8359e56";
  static const nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";

  static const topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const topRatedTvPath = "$baseUrl/tv/top_rated?api_key=$apiKey";
  static const popularTvPath = "$baseUrl/tv/popular?api_key=$apiKey";
  static const onAirTvPath = "$baseUrl/tv/on_the_air?api_key=$apiKey";

  static moviesDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static tvDetailsPath(int tvId) =>
      "$baseUrl/tv/$tvId?api_key=$apiKey";

  static String recommendationTvPath(int tvId) =>
      "$baseUrl/tv/$tvId/recommendations?api_key=$apiKey";

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String path) => '$baseImageUrl$path';

  static String searchPath(String title) =>
      "$baseUrl/search/multi?query=$title&api_key=$apiKey";
}
