import 'package:clean_arc_app/movies/domain/entites/movie.dart';

class MovieModel extends BaseMovie {
  MovieModel({required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(id: json["id"],
          title: json["title"],
          backdropPath: json["backdrop_path"],
          genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
          overView: json["overview"],
          /// TODO:CHECK THIS
          voteAverage: json["vote_average"].toDouble(),
          releaseDate: json["release_date"]);
}
