
import 'package:clean_arc_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:clean_arc_app/movies/data/repostory/movies_repo.dart';
import 'package:clean_arc_app/movies/domain/repostory/base_movies_repo.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_movie_details_data.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_top_rated.dart';
import 'package:clean_arc_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:clean_arc_app/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_arc_app/movies/presentation/controller/movies_events.dart';
import 'package:get_it/get_it.dart';

import '../../movies/domain/usecase/get_popular_movies.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
    sl.registerFactory(()=>MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(()=>MovieDetailsBloc(sl(),));
    // كل ما بنادي ع بلوك هيعمل نيو اوبجكت علشان يجيب الداتا جديده
    //use case
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsDataUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(()=>MovieRemoteDataSource());
  }

}