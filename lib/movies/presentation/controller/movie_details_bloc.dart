import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arc_app/core/utils/enum.dart';
import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/get_movie_details_data.dart';
import 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsDataUseCase getMovieDetailsDataUseCase;

  MovieDetailsBloc(this.getMovieDetailsDataUseCase)
      : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsDataUseCase(MovieDetailsParameter(event.id));


    result.fold((l) => emit(
      state.copyWith(
        movieDetailsState: RequestState.loaded,
        message: l.message
      )
    ), (r) => emit(
      state.copyWith(
        movieDetailsState: RequestState.loaded,
        movieDetails: r
      )
    ));
  }
}
