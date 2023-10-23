import 'package:flutter/material.dart';
import '../../core/utils/ui_constants/keys.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../widgets/general_widgets/movie_container.dart';
import 'home.dart';

class MovieGridView extends StatelessWidget {
  late final Bloc bloc;

  MovieGridView({
    required this.bloc,
    super.key,
  });

  late final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    final MovieCategory movieCategory =
        ModalRoute.of(context)!.settings.arguments as MovieCategory;
    initState(movieCategory);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Center(
        child: StreamBuilder<List<MovieEntity>>(
          stream: bloc.movieStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return GridView.builder(
                  key: gridViewBuilderKey,
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BasicMovieContainer(
                        movie: snapshot.data![index],
                        movieGenres: snapshot.data![index].genres
                            .map(
                              (genreId) => bloc.getGenre(genreId),
                            )
                            .toList(),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text(
                  "There was an error loading the movies, please try again later",
                  key: gridViewSnapshotErrorKey,
                );
              } else {
                return const Text(
                  "There was an unexpected error, please try again later",
                  key: gridViewUnexpectedErrorKey,
                );
              }
            }
          },
        ),
      ),
    );
  }

  void initState(MovieCategory movieCategory) {
    switch (movieCategory) {
      case MovieCategory.UPCOMING:
        appBarTitle = "Upcoming Movies";
        bloc.fetchUpcomingMovies();
      case MovieCategory.NOW_PLAYING:
        appBarTitle = "Now Playing Movies";
        bloc.fetchNowPlayingMovies();
      case MovieCategory.TOP_RATED:
        appBarTitle = "Top Rated Movies";
        bloc.fetchTopRatedMovies();
      case MovieCategory.POPULAR:
        appBarTitle = "Popular";
        bloc.fetchPopularMovies();
    }
  }
}
