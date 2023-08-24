import 'package:flutter/material.dart';
import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/domain/entity/movie.dart';
import 'package:flutter_projects/presentation/view/movie_main_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  late final MovieUI movieUI;

  setUp(
    () => {
      movieUI = MovieUI(
        movie: MovieEntity.defaultMovie(),
        genres: ["Drama", "Action"],
      )
    },
  );

  testWidgets('Test MovieMainWidget', (WidgetTester tester) async {
    await mockNetworkImagesFor(
      () => tester.pumpWidget(
        MaterialApp(
          home: Navigator(
            onGenerateRoute: (_) {
              return MaterialPageRoute<Widget>(
                builder: (_) => const MovieMainWidget(),
                settings: RouteSettings(arguments: movieUI),
              );
            },
          ),
        ),
      ),
    );

    expect(find.byType(MovieMainWidget), findsOneWidget);

    expect (find.byKey(saveMovieButtonHollowIconKey), findsOneWidget);
    expect (find.byIcon(Icons.star), findsWidgets);
    expect(find.text('Drama'), findsOneWidget);
    expect(find.text('Action'), findsOneWidget);

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.byType(MovieMainWidget), findsNothing);
  });
}
