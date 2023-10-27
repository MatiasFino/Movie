import 'package:flutter/material.dart';
import '../../core/utils/data_state.dart';
import '../../core/utils/ui_constants/keys.dart';
import '../../core/utils/ui_constants/strings.dart';
import '../../domain/entity/movie.dart';
import '../bloc/bloc.dart';
import '../widgets/general_widgets/basic_movie_container.dart';

class MovieGridView extends StatelessWidget {
  late final Bloc bloc;

  MovieGridView({
    required this.bloc,
    super.key,
  });

  late final String appBarTitle;
  static const double containersPadding = 8.0;
  static const gridViewCrossAxisCount = 2;

  void initState(EndPoint endPoint) {
    bloc.fetchMoviesByCategory(endPoint);
    appBarTitle = endPoint == EndPoint.NOW_PLAYING
        ? NowPlayingTitle
        : endPoint == EndPoint.UPCOMING
            ? UpcomingTitle
            : endPoint == EndPoint.TOP_RATED
                ? TopRatedTitle
                : PopularTitle;
  }

  @override
  Widget build(BuildContext context) {
    final EndPoint movieCategory =
        ModalRoute.of(context)!.settings.arguments as EndPoint;
    initState(movieCategory);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder<List<MovieEntity>>(
          stream: bloc.movieStream,
          builder: (
            BuildContext context,
            AsyncSnapshot<List<MovieEntity>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return GridView.builder(
                  key: gridViewBuilderKey,
                  itemCount: snapshot.data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridViewCrossAxisCount,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(containersPadding),
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
                  SnapshotCommonError,
                  key: gridViewSnapshotErrorKey,
                );
              } else {
                return const Text(
                  SnapshotUnexpectedError,
                  key: gridViewUnexpectedErrorKey,
                );
              }
            }
          },
        ),
      ),
    );
  }
}
