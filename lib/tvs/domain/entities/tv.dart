import 'package:equatable/equatable.dart';

class Tv extends Equatable {
  final String name;
  final int id;
  final List<int> genreId;
  final double voteAverage;
  final num voteCount;
  final String backdropPath;
  final String posterPath;

  const Tv({
    required this.name,
    required this.id,
    required this.voteAverage,
    required this.genreId,
    required this.voteCount,
    required this.backdropPath,
    required this.posterPath,
  });

  @override
  List<Object> get props => [
        name,
        id,
        genreId,
        voteAverage,
        voteCount,
        backdropPath,
        posterPath,
      ];
}
