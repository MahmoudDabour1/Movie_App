import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_with_clean/core/error/failure.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/search/domain/repositories/base_search_repository.dart';

import '../entities/search.dart';

class GetSearchUseCase extends BaseUseCase<List<Search>, SearchParameters> {
  final BaseSearchRepository baseSearchRepository;

  GetSearchUseCase(this.baseSearchRepository);

  @override
  Future<Either<Failure, List<Search>>> call(
      SearchParameters parameters) async {
    return await baseSearchRepository.getSearchItems(parameters);
  }
}

class SearchParameters extends Equatable {
  final String title;

  const SearchParameters({required this.title});

  @override
  List<Object> get props => [title];
}
