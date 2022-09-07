import 'package:clean_arc_app/core/utils/enum.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_movie_details_data.dart';

import 'package:clean_arc_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_top_rated.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/use_case/base_use_case.dart';
import '../../domain/usecase/get_popular_movies.dart';
import 'movies_events.dart';
import 'movies_state.dart';

class MovieBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MovieBloc(this.getNowPlayingMoviesUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase,

      )
      : super(MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase(const NoParameters());
      result.fold(
          (l) => emit(
            state.copyWith(
              nowPlayingState:RequestState.error ,
              nowPlayingMessage:  l.message
            )
              ),
          (r) => emit(
            state.copyWith(
              nowPlayingMovies: r,
              nowPlayingState: RequestState.loaded
            )
              ));

    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase(const NoParameters());
      result.fold(
          (l) => {
                emit(
                  state.copyWith(
          popularMoviesState: RequestState.error,
          popularMoviesMessage: l.message
          )

                    )
              },
          (r) => {
            emit(
              state.copyWith(
                popularMoviesState: RequestState.loaded,
                popularMovies: r
              )
            )
           });

    });


    on<GetTopRatedMoviesEvent>((event, emit) async{
      final result=await getTopRatedMoviesUseCase(const NoParameters());
      result.fold((l) => {
        emit(
          state.copyWith(
            topRatedMoviesState: RequestState.error,
            topRatedMoviesMessage: l.message
          )
        )
      }, (r) => {

        emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedMoviesState: RequestState.loaded
          )
        )
      });
    } );



  }
}
