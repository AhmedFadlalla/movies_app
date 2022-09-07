import 'package:equatable/equatable.dart';

import 'geners.dart';

class BaseMovieDetails extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final String overView;
  final double voteAverage;
  final String releaseDate;
  final int runTime;
  final List<Genres> genreNames;

  const BaseMovieDetails(
      {required this.id,
      required this.title,
      required this.backdropPath,
      required this.overView,
      required this.voteAverage,
      required this.releaseDate,
      required this.genreNames,
        required this.runTime
      });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,title,backdropPath,overView,voteAverage,releaseDate,genreNames,runTime
  ];
}
