import 'package:clean_arc_app/movies/data/models/genres_model.dart';
import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';

class MovieDetailsModel extends BaseMovieDetails {
  MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.overView,
      required super.voteAverage,
      required super.releaseDate,
      required super.genreNames,
        required super.runTime
      });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json)=>
      MovieDetailsModel(
          id: json["id"],
          title: json["title"],
          backdropPath: json["backdrop_path"],
          genreNames: List<GenresModel>.from(json["genres"].map((e) => GenresModel.fromJson(e))),
          overView: json["overview"],
          runTime: json["runtime"].toInt(),
          voteAverage: json["vote_average"].toDouble(),
          releaseDate: json["release_date"]);
}
