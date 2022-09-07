import 'package:clean_arc_app/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';
import '../repostory/base_movies_repo.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<BaseMovie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<BaseMovie>>>call(NoParameters parameters)async{
    return await baseMovieRepository.getPopularMovies();
  }
}