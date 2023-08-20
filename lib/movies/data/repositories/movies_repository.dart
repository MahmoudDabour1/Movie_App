import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/exception.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/movies/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_with_clean/movies/domain/entities/movie.dart';
import 'package:movies_with_clean/movies/domain/entities/movie_detail.dart';
import 'package:movies_with_clean/movies/domain/entities/recommendation.dart';
import 'package:movies_with_clean/movies/domain/repositories/base_movies_repository.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_movie_details_usecase.dart';
import 'package:movies_with_clean/movies/domain/use_cases/get_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    }on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(RecommendationParameters parameters) async{
    final result = await baseMovieRemoteDataSource.getRecommendation(parameters);
  try {
    return Right(result);
  }on ServerException catch (failure) {
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }
  }
}
