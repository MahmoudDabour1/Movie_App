import 'package:movies_with_clean/search/domain/entities/search.dart';

class SearchModel extends Search {
  const SearchModel({
    required super.backdropPath,
    required super.id,
    required super.title,
    required super.isMovie,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      backdropPath: json["backdrop_path"] ??'https://img.freepik.com/free-icon/x-symbol_318-1407.jpg',
      id: json["id"],
      title: json["title"] ?? json["name"],
      isMovie: json["media_type"] == "movie",
    );
  }
}
