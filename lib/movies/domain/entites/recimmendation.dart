import 'package:equatable/equatable.dart';

class BaseRecommendation extends Equatable{
  final int id;
  final String backdropPath;


  BaseRecommendation({
    required this.id,
    required this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,backdropPath
  ];





}