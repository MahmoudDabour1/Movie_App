import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv.dart';
import 'package:movies_with_clean/tvs/domain/repositories/base_tv_repository.dart';

class GetPopularTvUseCase extends BaseUseCase<List<Tv>,NoParameters>{
  final BaseTvRepository baseTvRepository;

  GetPopularTvUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameters parameters) async{
    return await baseTvRepository.getPopularTv();
  }

}