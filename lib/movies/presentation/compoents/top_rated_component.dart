import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc_app/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_arc_app/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/utils/app_constant.dart';
import '../../../core/utils/enum.dart';
import '../screens/details_screen.dart';
import '../screens/dummy.dart';
class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MoviesState>(
      buildWhen: (previous,current)=>previous.topRatedMoviesState !=current.topRatedMoviesState,
      builder: (BuildContext context, state) {
        switch(state.topRatedMoviesState){

          case RequestState.loading:
            return const Center(child: CircularProgressIndicator());
          case RequestState.loaded:
             return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen(id: movie.id)));
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: AppContances.imageUrl(movie.backdropPath),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
          case RequestState.error:
            return SizedBox(
              height:400 ,
              child: Text(state.topRatedMoviesMessage),
            );
        }

      },

    );
  }
}
