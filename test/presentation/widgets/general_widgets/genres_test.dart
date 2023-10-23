import 'package:flutter/material.dart';
import 'package:flutter_projects/presentation/widgets/general_widgets/genres.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GenresToScrollableList should render correctly', (WidgetTester tester) async {
    final List<String> testGenres = ['Action', 'Adventure', 'Sci-Fi'];
    const TextStyle testStyle =  TextStyle(fontSize: 16);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GenresToScrollableList(
            genres: testGenres,
            style: testStyle,
          ),
        ),
      ),
    );

    final listView = find.byType(ListView);
    expect(listView, findsOneWidget);

    final listViewWidget = tester.widget<ListView>(listView);
    expect(listViewWidget.scrollDirection, Axis.horizontal);

    final genreTextWidgets = find.byType(Text);
    expect(genreTextWidgets, findsNWidgets(testGenres.length));

    for (var i = 0; i < testGenres.length; i++) {
      final textWidget = tester.widget<Text>(find.text(testGenres[i]));
      expect(textWidget.style, testStyle);
    }
  });

}
