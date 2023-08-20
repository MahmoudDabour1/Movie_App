import 'package:movies_with_clean/tvs/data/models/genres_model.dart';
import 'package:movies_with_clean/tvs/domain/entities/tv_detail.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel({
    required super.backdropPath,
    required super.episodeRunTime,
    required super.overview,
    required super.originalName,
    required super.voteAverage,
    required super.firstAirDate,
    required super.id,
    required super.genres, required super.posterPath,
  });

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
      id: json["id"],
      backdropPath: json["backdrop_path"],
      originalName: json["original_name"],
      overview: json["overview"],
      voteAverage: json["vote_average"].toDouble(),
      firstAirDate: json["first_air_date"],
      genres: List<GenresModel>.from(
          json["genres"].map((x) => GenresModel.fromJson(x))),
      episodeRunTime: List<int>.from(json["episode_run_time"].map((e) => e)),
      posterPath: json["poster_path"],
    );
  }
}
