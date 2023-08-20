part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> onAirTv;
  final RequestState onAirState;
  final String onAirMessage;

  final List<Tv> popularTv;
  final RequestState popularState;
  final String popularMessage;

  final List<Tv> topRatedTv;
  final RequestState topRatedState;
  final String topRatedMessage;

  const TvState({
    this.onAirTv = const [],
    this.onAirState = RequestState.loading,
    this.onAirMessage = '',
    this.popularTv = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedTv = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
  });

  TvState copyWith({
     List<Tv>? onAirTv,
     RequestState? onAirState,
     String? onAirMessage,

     List<Tv>? popularTv,
     RequestState? popularState,
     String? popularMessage,

     List<Tv>? topRatedTv,
     RequestState? topRatedState,
     String? topRatedMessage,

  }){
    return TvState(
      onAirTv: onAirTv ?? this.onAirTv,
      onAirState: onAirState ?? this.onAirState,
      onAirMessage:  onAirMessage ?? this.onAirMessage,

      popularTv:  popularTv ?? this.popularTv,
      popularState: popularState ?? this.popularState,
      popularMessage:  popularMessage ?? this.popularMessage,

      topRatedTv:  topRatedTv ?? this.topRatedTv,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage?? this.topRatedMessage,

    );
  }

  @override
  List<Object> get props =>
      [
        onAirTv,
        onAirState,
        onAirMessage,
        popularTv,
        popularState,
        popularMessage,
        topRatedTv,
        topRatedState,
        topRatedMessage,
      ];
}
