import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv_detail.dart';
import 'package:movies_with_clean/tvs/domain/repositories/base_tv_repository.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetails,TvDetailsParameters>{
  final BaseTvRepository baseTvRepository;

  GetTvDetailsUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetails>> call(TvDetailsParameters parameters)async{
    return await baseTvRepository.getTvDetails(parameters);
  }

}


class TvDetailsParameters extends Equatable {
  final int tvId;

  const TvDetailsParameters({required this.tvId});

  @override
  List<Object> get props => [tvId];
}