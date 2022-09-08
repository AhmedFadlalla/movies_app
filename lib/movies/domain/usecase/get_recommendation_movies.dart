import 'package:clean_arc_app/core/error/failure.dart';
import 'package:clean_arc_app/core/use_case/base_use_case.dart';
import 'package:clean_arc_app/movies/domain/entites/recimmendation.dart';
import 'package:clean_arc_app/movies/domain/repostory/base_movies_repo.dart';
import 'package:clean_arc_app/movies/domain/usecase/get_movie_details_data.dart';
import 'package:dartz/dartz.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<BaseRecommendation>,MovieDetailsParameter>{
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<BaseRecommendation>>> call(MovieDetailsParameter parameters)async {
    return await baseMovieRepository.getRecommendationMovies(parameters);
  }

}