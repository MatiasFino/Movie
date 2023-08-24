import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/widgets/movie_presentation/movie_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MovieTitle widget displays movie title',

          (WidgetTester tester) async {
    const String mockTitle = "Mock Movie";

    await tester.pumpWidget(
      const MaterialApp(
        home: MovieTitle(movieTitle: mockTitle),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(MovieTitle),findsOneWidget);

  });
}
