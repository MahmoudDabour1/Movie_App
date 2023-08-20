import 'package:dartz/dartz.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/search/domain/use_cases/search_usecase.dart';

import '../entities/search.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure,List<Search>>> getSearchItems(SearchParameters parameters);
}