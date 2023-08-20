import 'package:movies_with_clean/tvs/domain/entities/recommendation.dart';

class RecommendationTvModel extends RecommendationTv {
  const RecommendationTvModel({
    required super.backdropPath,
    required super.id,
  });

  factory RecommendationTvModel.fromJson(Map<String, dynamic> json) {
    return RecommendationTvModel(
      id: json["id"],
      backdropPath: json["backdrop_path"] ??
          'https://img.freepik.com/free-icon/x-symbol_318-1407.jpg',
    );
  }
}
