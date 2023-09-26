import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_impl.dart';
import '../widgets/home_presentation/home_drawer.dart';
import '../widgets/home_presentation/movie_container.dart';

class HomeView extends StatelessWidget {
  final Bloc bloc = BlocImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      body: HomePageViews(),
    );
  }
}

class HomePageViews extends StatefulWidget {
  final Bloc bloc = BlocImpl();

  HomePageViews({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomePageViewsState();
}

  class _HomePageViewsState extends State<HomePageViews>{

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieEntity>>(
      stream: widget.bloc.movieStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return Column(
            children: [
              MoviePageView(
                bloc: widget.bloc,
                movieCategory: MovieCategory.POPULAR,
                containerType: MovieContainerType.BASIC,
              ),
              MoviePageView(
                bloc: widget.bloc,
                movieCategory: MovieCategory.TOP_RATED,
                containerType: MovieContainerType.WIDE,
              ),
              MoviePageView(
                bloc: widget.bloc,
                movieCategory: MovieCategory.NOW_PLAYING,
                containerType: MovieContainerType.BASIC,
              ),
            ],
          );
        }
      },
    );
  }
}

class MoviePageView extends StatefulWidget {
  final MovieCategory movieCategory;
  final MovieContainerType containerType;
  final Bloc bloc;

  const MoviePageView({
    super.key,
    required this.containerType,
    required this.movieCategory,
    required this.bloc,
  });

  @override
  State<StatefulWidget> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  @override
  void initState() {
    super.initState();
    switch (widget.movieCategory) {
      case MovieCategory.UPCOMING:
        widget.bloc.fetchUpcomingMovies();
      case MovieCategory.NOW_PLAYING:
        widget.bloc.fetchNowPlayingMovies();
      case MovieCategory.TOP_RATED:
        widget.bloc.fetchTopRatedMovies();
      case MovieCategory.POPULAR:
        widget.bloc.fetchPopularMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MovieEntity>>(
      stream: widget.bloc.movieStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
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
        }
      },
    );
  }
}

enum MovieCategory {
  POPULAR,
  TOP_RATED,
  UPCOMING,
  NOW_PLAYING,
}
