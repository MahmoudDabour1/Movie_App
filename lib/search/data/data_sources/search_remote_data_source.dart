import 'package:dio/dio.dart';
import 'package:movies_with_clean/core/error/exception.dart';
import 'package:movies_with_clean/core/network/api_constance.dart';
import 'package:movies_with_clean/core/network/error_message_model.dart';
import 'package:movies_with_clean/search/data/models/search_model.dart';
import 'package:movies_with_clean/search/domain/use_cases/search_usecase.dart';

import '../../domain/entities/search.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<Search>> searchItem(SearchParameters parameters);
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<List<Search>> searchItem(SearchParameters parameters) async {
    final response = await Dio().get(ApiConstance.searchPath(parameters.title));
    if (response.statusCode == 200) {
      return List<SearchModel>.from(
        (response.data["results"] as List)
            .where((element) => element["media_type"] != "person")
            .map(
              (e) => SearchModel.fromJson(e),
            ).toList(),
      );
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
