import 'package:flutter/material.dart';

import '../../../domain/entity/movie.dart';
import '../../bloc/bloc.dart';
import '../../view/home.dart';
import '../general_widgets/movie_container.dart';

class MoviePageView extends StatefulWidget {
  final MovieCategory movieCategory;
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
    switch (widget.movieCategory) {
      case MovieCategory.UPCOMING:
        widget.bloc.fetchUpcomingMovies();
        break;
      case MovieCategory.NOW_PLAYING:
        widget.bloc.fetchNowPlayingMovies();
        break;
      case MovieCategory.TOP_RATED:
        widget.bloc.fetchTopRatedMovies();
        break;
      case MovieCategory.POPULAR:
        widget.bloc.fetchPopularMovies();
        break;
    }
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
              itemBuilder: (BuildContext context, int index) {
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
