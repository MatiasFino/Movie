import 'package:flutter/material.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_impl.dart';
import '../widgets/general_widgets/movie_container.dart';
import 'home.dart';

class MovieGridView extends StatelessWidget {
  MovieGridView({super.key});

  final Bloc bloc = BlocImpl();

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
              return GridView.builder(
                itemCount: snapshot.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return BasicMovieContainer(
                    movie: snapshot.data![index],
                    movieGenres: snapshot.data![index].genres
                        .map(
                          (genreId) => bloc.getGenre(genreId),
                        )
                        .toList(),
                  );
                },
              );
            }
          },
        )
        // ),
        ,
      ),
    );
  }

  void initState(MovieCategory movieCategory) {
    switch (movieCategory) {
      case MovieCategory.UPCOMING:
        {
          appBarTitle = "Upcoming Movies";
          bloc.fetchUpcomingMovies();
        }
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
