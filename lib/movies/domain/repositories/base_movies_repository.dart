import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/movies/domain/entities/recommendation.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';
import '../use_cases/get_movie_details_usecase.dart';
import '../use_cases/get_recommendation_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters);

  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      RecommendationParameters parameters);
}
