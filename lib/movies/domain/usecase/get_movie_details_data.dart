import 'package:clean_arc_app/core/error/failure.dart';
import 'package:clean_arc_app/core/use_case/base_use_case.dart';
import 'package:clean_arc_app/movies/domain/entites/movie_details.dart';
import 'package:clean_arc_app/movies/domain/repostory/base_movies_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailsDataUseCase extends BaseUseCase<BaseMovieDetails,MovieDetailsParameter>{
  BaseMovieRepository baseMovieRepository;

  GetMovieDetailsDataUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, BaseMovieDetails>> call(MovieDetailsParameter parameters) async{
  return await baseMovieRepository.getMovieDetailsData(parameters);
  }

}
class MovieDetailsParameter extends Equatable{
  final int movieId;

  const MovieDetailsParameter(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];

}