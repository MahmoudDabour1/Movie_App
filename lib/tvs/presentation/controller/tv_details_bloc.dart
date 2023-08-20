import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_with_clean/core/utils/enums.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv_detail.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_tv_details_usecase.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/use_cases/get_recommendation_usecase.dart';

part 'tv_details_event.dart';

part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  TvDetailsBloc(this.getTvDetailsUseCase, this.getTvRecommendationUseCase)
      : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getTvRecommendation);
  }

  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTvRecommendationUseCase getTvRecommendationUseCase;

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvDetailsUseCase(TvDetailsParameters(tvId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        tvDetailsMessage: l.message,
        tvRequestState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          tvDetails: r,
          tvRequestState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTvRecommendation(
      GetTvRecommendationEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
      (l) => emit(state.copyWith(
        recommendationMessage: l.message,
        recommendationState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
            recommendation: r, recommendationState: RequestState.loaded),
      ),
    );
  }
}
