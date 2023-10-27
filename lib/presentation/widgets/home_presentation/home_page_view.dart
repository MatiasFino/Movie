import 'package:flutter/material.dart';

import '../../../core/utils/data_state.dart';
import '../../../domain/entity/movie.dart';
import '../../bloc/bloc.dart';
import '../general_widgets/basic_movie_container.dart';
import '../general_widgets/movie_container_type.dart';
import '../general_widgets/wide_movie_container.dart';

class MoviePageView extends StatefulWidget {
  final EndPoint movieCategory;
  final MovieContainerType containerType;
  final Bloc bloc;

  MoviePageView({
    required this.bloc,
    super.key,
    required this.containerType,
    required this.movieCategory,
  });

  @override
  State<StatefulWidget> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    widget.bloc.fetchMoviesByCategory(widget.movieCategory);
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<MovieEntity>>(
      stream: widget.bloc.movieStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasData) {
            return PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                switch (widget.containerType) {
                  case MovieContainerType.BASIC:
                    return BasicMovieContainer(
                      movie: snapshot.data![index],
                      movieGenres: snapshot.data![index].genres
                          .map(
                            (genreId) => widget.bloc.getGenre(genreId),
                          )
                          .toList(),
                    );
                  case MovieContainerType.WIDE:
                    return WideContainer(
                      movie: snapshot.data![index],
                      movieGenres: snapshot.data![index].genres
                          .map(
                            (genreId) => widget.bloc.getGenre(genreId),
                          )
                          .toList(),
                    );
                  default:
                    return BasicMovieContainer(
                      movie: snapshot.data![index],
                      movieGenres: snapshot.data![index].genres
                          .map(
                            (genreId) => widget.bloc.getGenre(genreId),
                          )
                          .toList(),
                    );
                }
              },
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        }
      },
    );
  }
}
