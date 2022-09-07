import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/use_case/base_use_case.dart';
import '../entites/movie.dart';
import '../repostory/base_movies_repo.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<BaseMovie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure,List<BaseMovie>>>call(NoParameters parameters)async{
    return await baseMovieRepository.getTopRatedMovies();
  }
}