part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOnAirTvEvent extends TvEvent {}

class GetPopularTvEvent extends TvEvent {}

class GetTopRatedTvEvent extends TvEvent {}
