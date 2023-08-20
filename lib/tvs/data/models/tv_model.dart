import 'package:movies_with_clean/tvs/domain/entities/tv.dart';

class TvModel extends Tv {
  const TvModel({
    required super.name,
    required super.id,
    required super.voteAverage,
    required super.genreId,
    required super.voteCount,
    required super.backdropPath, required super.posterPath,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) =>  TvModel(
    name: json["name"],
    id: json["id"],
    voteAverage: json["vote_average"].toDouble(),
    genreId: List<int>.from(json["genre_ids"].map((e) => e)),
    voteCount: json["vote_count"],
    backdropPath: json["backdrop_path"]??'https://img.freepik.com/free-icon/x-symbol_318-1407.jpg',
    posterPath: json["poster_path"] ??'https://img.freepik.com/free-icon/x-symbol_318-1407.jpg',

  );
}
