

import 'package:clean_arc_app/movies/data/models/movie_details_model.dart';
import 'package:clean_arc_app/movies/data/models/movie_model.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_movie_details_data.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/utils/app_constant.dart';
abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetailsData(MovieDetailsParameter parameter);
}
class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies()async{

    final response=await Dio().get(AppContances.nowPlayingMoviesPath);


    if(response.statusCode==200){
      return List<MovieModel>
          .from((response.data["results"]as List)
          .map((e) => MovieModel.fromJson(e)));
    }
    else{
      print(response.data);

      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data)
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{

    final response=await Dio().get(AppContances.popularMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{

    final response=await Dio().get(AppContances.topRatedMoviesPath);
    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"] as List).map((e) =>MovieModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetailsData(MovieDetailsParameter parameter) async{
    final response =await Dio().get(AppContances.movieDetails(parameter.movieId)) ;
    
    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data);
    }
    else
      {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
  }

}