import 'package:movies_with_clean/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    required super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json["backdrop_path"]??'https://img.freepik.com/free-icon/x-symbol_318-1407.jpg',
      id: json["id"],
    );
  }
}
