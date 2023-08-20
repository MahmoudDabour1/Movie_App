import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/exception.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/tvs/domain/entities/recommendation.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv_detail.dart';
import 'package:movies_with_clean/tvs/domain/repositories/base_tv_repository.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_tv_details_usecase.dart';

import '../data_sources/tv_remote_data_source.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getOnAirTv() async {
    final result = await baseTvRemoteDataSource.getOnAirTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationTv>>> getRecommendationTv(
      RecommendationParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      TvDetailsParameters parameters) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
