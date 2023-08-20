import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv_detail.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_tv_details_usecase.dart';

import '../entities/recommendation.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getOnAirTv();

  Future<Either<Failure, List<Tv>>> getPopularTv();

  Future<Either<Failure, List<Tv>>> getTopRatedTv();

  Future<Either<Failure, TvDetails>> getTvDetails(
    TvDetailsParameters parameters,
  );

  Future<Either<Failure, List<RecommendationTv>>> getRecommendationTv(
      RecommendationParameters parameters);
}
