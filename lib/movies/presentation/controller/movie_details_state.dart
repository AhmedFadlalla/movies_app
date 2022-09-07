part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {

  final BaseMovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;


   MovieDetailsState({
    this.movieDetails,
    this.movieDetailsState=RequestState.loading,
    this.message=''});

  MovieDetailsState copyWith({
    BaseMovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? message
}){
  return MovieDetailsState(
    movieDetails: movieDetails??this.movieDetails,
    movieDetailsState: movieDetailsState??this.movieDetailsState,
    message: message??this.message
  );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetails,movieDetailsState,message
  ];


}


