import 'package:dio/dio.dart';
import 'package:movies_with_clean/tvs/data/models/recommendation_model.dart';
import 'package:movies_with_clean/tvs/data/models/tv_details_model.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_recommendation_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_tv_details_usecase.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/tv.dart';
import '../models/tv_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getOnAirTv();

  Future<List<Tv>> getPopularTv();

  Future<List<Tv>> getTopRatedTv();

  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters);

  Future<List<RecommendationTvModel>> getTvRecommendation(
    RecommendationParameters parameters,
  );
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getOnAirTv() async {
    final response = await Dio().get(ApiConstance.onAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Tv>> getPopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvPath);
    if (response.statusCode == 200) {
      return List<Tv>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Tv>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<Tv>.from(
          (response.data["results"] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.tvDetailsPath(parameters.tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationTvModel>> getTvRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationTvPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationTvModel>.from((response.data["results"] as List)
          .map((e) => RecommendationTvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
