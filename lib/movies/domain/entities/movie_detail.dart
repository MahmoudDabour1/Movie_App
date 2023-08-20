import 'package:equatable/equatable.dart';

import 'generes.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genres> genres;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final String posterPath;
  final double voteAverage;

  const MovieDetail({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
    required this.posterPath,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
        genres,
        posterPath,
      ];
}
