part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  final BaseMovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;
  final List<BaseRecommendation> recommendationMovies;
  final RequestState  recommendationMoviesState;
  final String  recommendationMoviesMessage;


   MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState=RequestState.loading,
    this.message='',
     this.recommendationMovies=const [],
     this.recommendationMoviesState=RequestState.loading,
     this.recommendationMoviesMessage=''});

  MovieDetailsState copyWith({
    BaseMovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? message,
     List<BaseRecommendation>? recommendationMovies,
     RequestState?  recommendationMoviesState,
     String ? recommendationMoviesMessage,
}){
  return MovieDetailsState(
    movieDetails: movieDetails??this.movieDetails,
    movieDetailsState: movieDetailsState??this.movieDetailsState,
    message: message??this.message,
      recommendationMovies: recommendationMovies??this.recommendationMovies,
      recommendationMoviesState: recommendationMoviesState??this.recommendationMoviesState,
      recommendationMoviesMessage: recommendationMoviesMessage??this.recommendationMoviesMessage
  );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetails,movieDetailsState,message,
    recommendationMovies,recommendationMoviesState,recommendationMoviesMessage
  ];


}


