import 'package:flutter/material.dart';
import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/presentation/widgets/movie_presentation/top_row.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('TopRow widget displays correctly', (WidgetTester tester) async {
    const int initialLikes = 42;
    const double initialVoteAverage = 8.5;
    const String posterUrl = 'your_poster_url_here';

    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TopRow(
              likes: initialLikes,
              poster: posterUrl,
              voteAverage: initialVoteAverage,
            ),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    final posterContainerFinder = find.byWidgetPredicate((widget) {
      if (widget is Container && widget.decoration is BoxDecoration) {
        final BoxDecoration decoration = widget.decoration as BoxDecoration;
        final DecorationImage? image = decoration.image;
        if (image != null &&
            image.image is NetworkImage &&
            (image.image as NetworkImage).url == posterUrl) {
          return true;
        }
      }
      return false;
    });

    expect(posterContainerFinder, findsOneWidget);

    final saveMovieButtonFinder = find.byKey(saveMovieButtonFilledIconKey);
    expect(saveMovieButtonFinder, findsOneWidget);

    final likeCounterFinder = find.byKey(likeCounterKey);
    expect(likeCounterFinder, findsOneWidget);

    final voteAverageTextFinder = find.text(initialVoteAverage.toString());
    expect(voteAverageTextFinder, findsOneWidget);

    final starIconFinder = find.byIcon(Icons.star);
    expect(starIconFinder, findsWidgets);

    final initialLikesTextFinder = find.text(initialLikes.toString());
    expect(initialLikesTextFinder, findsOneWidget);
  });
}
