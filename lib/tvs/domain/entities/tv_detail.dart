import 'package:equatable/equatable.dart';

import 'genres_tv.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final String posterPath;
  final List<int> episodeRunTime;
  final String overview;
  final String originalName;
  final double voteAverage;
  final String firstAirDate;
  final int id;
  final List<GenresTv> genres;

  const TvDetails({
    required this.backdropPath,
    required this.episodeRunTime,
    required this.overview,
    required this.originalName,
    required this.voteAverage,
    required this.firstAirDate,
    required this.id,
    required this.genres,
    required this.posterPath,
  });

  @override
  List<Object> get props => [
        backdropPath,
        episodeRunTime,
        overview,
        originalName,
        voteAverage,
        firstAirDate,
        id,
        genres,
        posterPath,
      ];
}
