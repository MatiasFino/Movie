import 'package:flutter/material.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/movie_container.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('BasicMovieContainer should render correctly',
      (WidgetTester tester) async {
    final MovieEntity testMovie = MovieEntity.defaultMovie();
    final List<String> testGenres = [
      'Action',
      'Adventure',
    ];

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicMovieContainer(
              movie: testMovie,
              movieGenres: testGenres,
            ),
          ),
        ),
      ),
    );

    // Expect to find an InkWell widget.

    expect(find.image(NetworkImage(testMovie.posterUrl)), findsOneWidget);

    final inkWell = find.byType(InkWell);

    expect(inkWell, findsOneWidget);

    // Simulate a single tap on the InkWell.
    await tester.tap(inkWell);
    await tester.pumpAndSettle();

    // Now you can add expectations based on the behavior of the app when navigating.
    // For example, you can check if a certain route has been pushed to the Navigator.
  });
}
