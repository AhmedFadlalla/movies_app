import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../usecase/get_movie_details_data.dart';

abstract class BaseMovieRepository{
  Future<Either<Failure,List<BaseMovie>>> getNowPlaying();
  Future<Either<Failure,List<BaseMovie>>> getPopularMovies();
  Future<Either<Failure,List<BaseMovie>>> getTopRatedMovies();

  Future<Either<Failure,BaseMovieDetails>> getMovieDetailsData(MovieDetailsParameter parameter) ;
}