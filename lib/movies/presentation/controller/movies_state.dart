import 'package:clean_arc_app/core/utils/enum.dart';
import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entites/movie.dart';

class MoviesState extends Equatable {
  final List<BaseMovie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<BaseMovie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;
  final List<BaseMovie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;


  MoviesState({
    this.nowPlayingMovies=const [],
    this.nowPlayingState =RequestState.loading,
    this.nowPlayingMessage='',
    this.popularMovies=const [],
    this.popularMoviesState =RequestState.loading,
    this.popularMoviesMessage='',
    this.topRatedMovies=const [],
    this.topRatedMoviesState =RequestState.loading,
    this.topRatedMoviesMessage='',


  });

  MoviesState copyWith({
     List<BaseMovie>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<BaseMovie>? popularMovies,
     RequestState? popularMoviesState,
     String? popularMoviesMessage,
    List<BaseMovie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,

}){
    return MoviesState(
      nowPlayingMovies:nowPlayingMovies??this.nowPlayingMovies,
      nowPlayingState :nowPlayingState??this.nowPlayingState,
      nowPlayingMessage:nowPlayingMessage??this.nowPlayingMessage,
      popularMovies:popularMovies??this.popularMovies,
      popularMoviesState :popularMoviesState??this.popularMoviesState,
      popularMoviesMessage:popularMoviesMessage??this.popularMoviesMessage,
      topRatedMovies:topRatedMovies??this.topRatedMovies,
      topRatedMoviesState :topRatedMoviesState??this.topRatedMoviesState,
      topRatedMoviesMessage:topRatedMoviesMessage??this.topRatedMoviesMessage,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularMoviesState,
    popularMoviesMessage,
    topRatedMovies,
    topRatedMoviesState,
    topRatedMoviesMessage,

  ];
}
