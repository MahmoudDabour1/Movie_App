import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/tvs/domain/entities/recommendation.dart';
import 'package:movies_with_clean/tvs/domain/repositories/base_tv_repository.dart';

class GetTvRecommendationUseCase
    extends BaseUseCase<List<RecommendationTv>, RecommendationParameters> {
  final BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<RecommendationTv>>> call(
      RecommendationParameters parameters) async {
    return await baseTvRepository.getRecommendationTv(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
