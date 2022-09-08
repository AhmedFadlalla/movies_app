import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable{
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
class GetRecommendationsDetailsEvent extends MovieDetailsEvent{
  final int id;

  GetRecommendationsDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}



