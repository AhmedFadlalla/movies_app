import 'package:clean_arc_app/movies/domain/entites/recimmendation.dart';

class RecommendationModel extends BaseRecommendation{
  RecommendationModel({required super.id, required super.backdropPath});
  
  factory RecommendationModel.fromJson(Map<String,dynamic>json)=>RecommendationModel(
        id: json["id"],
        backdropPath: json["backdrop_path"]
    );

}