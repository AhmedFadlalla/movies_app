import 'package:clean_arc_app/core/error/exceptions.dart';
import 'package:clean_arc_app/core/error/failure.dart';
import 'package:clean_arc_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_arc_app/movies/domain/entites/movie.dart';
import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_movie_details_data.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/repostory/base_movies_repo.dart';

class MoviesRepository extends BaseMovieRepository{
 final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

 MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure,List<BaseMovie>>> getNowPlaying()async {
   final result= await baseMovieRemoteDataSource.getNowPlayingMovies();

   try{
    return Right(result);
   }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }

  }

  @override
  Future<Either<Failure, List<BaseMovie>>> getPopularMovies() async{
   final result= await baseMovieRemoteDataSource.getPopularMovies();

   try{
    return Right(result);
   }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, List<BaseMovie>>> getTopRatedMovies() async{
   final result= await baseMovieRemoteDataSource.getTopRatedMovies();

   try{
    return Right(result);
   }on ServerException catch(failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }

  @override
  Future<Either<Failure, BaseMovieDetails>> getMovieDetailsData(MovieDetailsParameter parameter)async {
   final result =await baseMovieRemoteDataSource.getMovieDetailsData(parameter);

   try{
    return Right(result);
   }
   on ServerException catch(failure) {
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
   }
  }





}