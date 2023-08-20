import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/movies/domain/entities/recommendation.dart';
import 'package:movies_with_clean/movies/domain/repositories/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMoviesRepository.getRecommendationMovies(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
