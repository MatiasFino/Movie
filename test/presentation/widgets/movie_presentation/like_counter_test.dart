import 'package:flutter/material.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/view/movie_main_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockMovieUI extends Mock implements MovieUI {}

void main() {
  testWidgets('LikeCounter increments likes when tapped',
      (WidgetTester tester) async {

    await mockNetworkImagesFor(
      ()  =>  tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onGenerateRoute: (_) {
              return MaterialPageRoute<Widget>(
                builder: (_) => const MovieMainWidget(),
                settings: RouteSettings(
                  arguments: MovieUI(
                    movie: MovieEntity.defaultMovie(),
                    genres: [
                      "Action",
                      "Adventure",
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);

  });
}
