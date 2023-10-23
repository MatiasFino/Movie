import 'package:flutter/material.dart';
import 'package:flutter_projects/core/utils/ui_constants/keys.dart';
import 'package:flutter_projects/presentation/widgets/movie_presentation/save_movie_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SaveMovieButton toggles between saved and unsaved',
          (WidgetTester tester) async {

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('SaveMovieButton Test'),
              ),
              body: const SaveMovieButton(),
            ),
          ),
        );

        final initialFilledIconFinder = find.byKey(saveMovieButtonFilledIconKey);
        expect(initialFilledIconFinder, findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final savedIconFinder = find.byKey(saveMovieButtonHollowIconKey);
        expect(savedIconFinder, findsOneWidget);

        await tester.tap(find.byType(IconButton));
        await tester.pumpAndSettle();

        final initialHollowIconFinder = find.byKey(saveMovieButtonFilledIconKey);
        expect(initialHollowIconFinder, findsOneWidget);
      });
}
