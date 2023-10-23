import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/stars.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Stars widget should render correctly', (WidgetTester tester) async {
    const double testVoteAverage = 7.5;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Stars(testVoteAverage),
        ),
      ),
    );

    final starsFinder = find.byType(Stars);
    expect(starsFinder, findsOneWidget);

  });
}
