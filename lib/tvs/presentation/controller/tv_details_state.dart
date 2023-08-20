part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  const TvDetailsState({
    this.tvDetails,
    this.tvRequestState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  final TvDetails? tvDetails;
  final RequestState tvRequestState;
  final String tvDetailsMessage;

  final List<RecommendationTv> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  TvDetailsState copyWith({
    TvDetails? tvDetails,
    RequestState? tvRequestState,
    String? tvDetailsMessage,
    List<RecommendationTv>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return TvDetailsState(
      tvDetails: tvDetails ?? this.tvDetails,
      tvRequestState: tvRequestState ?? this.tvRequestState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        tvDetails,
        tvRequestState,
        tvDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
