import 'package:clean_arc_app/movies/domain/entites/movie.dart';
import 'package:clean_arc_app/movies/domain/repostory/base_movies_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<BaseMovie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<BaseMovie>>>call(NoParameters parameters)async{
    return  await baseMovieRepository.getNowPlaying();
  }
}