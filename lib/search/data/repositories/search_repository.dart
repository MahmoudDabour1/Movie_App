import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/exception.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/search/data/data_sources/search_remote_data_source.dart';
import 'package:movies_with_clean/search/domain/entities/search.dart';
import 'package:movies_with_clean/search/domain/repositories/base_search_repository.dart';
import 'package:movies_with_clean/search/domain/use_cases/search_usecase.dart';

class SearchRepository extends BaseSearchRepository {
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepository(this.baseSearchRemoteDataSource);

  @override
  Future<Either<Failure, List<Search>>> getSearchItems(
      SearchParameters parameters) async {
    final result = await baseSearchRemoteDataSource.searchItem(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
