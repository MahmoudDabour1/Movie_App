import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String backdropPath;
  final int id;
  final String title;
  final bool isMovie;

  const Search({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.isMovie,
  });

  @override
  List<Object> get props => [
        backdropPath,
        id,
        title,
        isMovie,
      ];
}
