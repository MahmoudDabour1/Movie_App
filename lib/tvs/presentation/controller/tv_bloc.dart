import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_with_clean/core/usecase/base_usecase.dart';
import 'package:movies_with_clean/core/utils/enums.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_popular_tv_usecase.dart';
import 'package:movies_with_clean/tvs/domain/use_cases/get_top_rated_tv_usecase.dart';

import '../../domain/entities/tv.dart';
import '../../domain/use_cases/get_on_air_usecase.dart';

part 'tv_event.dart';

part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetOnAirTvUseCase getOnAirTvUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;

  TvBloc(
    this.getOnAirTvUseCase,
    this.getPopularTvUseCase,
    this.getTopRatedTvUseCase,
  ) : super(const TvState()) {
    on<GetOnAirTvEvent>(_getOnAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
  }

  FutureOr<void> _getOnAirTv(
      GetOnAirTvEvent event, Emitter<TvState> emit) async {
    final result = await getOnAirTvUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              onAirState: RequestState.error,
              onAirMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              onAirTv: r,
              onAirState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTvUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularTv: r,
              popularState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTvUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedTv: r,
              topRatedState: RequestState.loaded,
            )));
  }
}
